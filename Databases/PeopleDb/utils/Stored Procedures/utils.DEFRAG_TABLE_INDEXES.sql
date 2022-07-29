CREATE PROCEDURE [utils].[DEFRAG_TABLE_INDEXES]
	@limit FLOAT = 5.0
	,@tableName SYSNAME
AS
	SET NOCOUNT ON;

	BEGIN TRY

		DECLARE @dbName SYSNAME = DB_NAME();
		DECLARE @dbId SMALLINT = DB_ID(@dbName);
		DECLARE @tableObjectId INT = OBJECT_ID(@tableName);
		DECLARE @object_id INT;
		DECLARE @index_id INT;
		DECLARE @name SYSNAME;
		DECLARE @is_primary_key BIT;
		DECLARE @partition_number INT;
		DECLARE @avg_fragmentation_in_percent FLOAT;
		DECLARE @command nvarchar(4000);
		DECLARE @schemaName SYSNAME = N'app';
		DECLARE @schemaId INT = (select schema_id FROM sys.schemas WHERE name = @schemaName);   

		CREATE TABLE #IndexStats(
			[object_id] INT, 
			[index_id] INT,
			[name] SYSNAME,
			[is_primary_key] BIT,
			[partition_number] INT,
			[avg_fragmentation_in_percent] FLOAT,
		);

		INSERT INTO #IndexStats ([object_id], [index_id], [name], [is_primary_key], [partition_number], [avg_fragmentation_in_percent])
		SELECT 
			 IDX_STATS.object_id
			,IDX_STATS.index_id
			,IDX.name
			,IDX.is_primary_key
			,IDX_STATS.partition_number
			,IDX_STATS.avg_fragmentation_in_percent
		FROM sys.dm_db_index_physical_stats(@dbId, @tableObjectId, NULL, NULL, N'LIMITED') IDX_STATS
		INNER JOIN sys.indexes IDX 
		ON IDX.object_id = IDX_STATS.object_id AND IDX.index_id = IDX_STATS.index_id
		WHERE IDX_STATS.index_id > 0;

		DECLARE index_stats_cursor CURSOR FOR 
			SELECT [object_id], [index_id], [name], [is_primary_key], [partition_number], [avg_fragmentation_in_percent] 
			FROM #IndexStats
			ORDER BY [is_primary_key], [index_id], [partition_number], [name];  

		OPEN index_stats_cursor;

		FETCH NEXT FROM index_stats_cursor 
		INTO @object_id, @index_id, @name, @is_primary_key, @partition_number, @avg_fragmentation_in_percent;

		WHILE (@@FETCH_STATUS = 0)
		BEGIN
		
			IF (@avg_fragmentation_in_percent > @limit)
			BEGIN
				--IF (@avg_fragmentation_in_percent <= 5.0)
				--	IF (@is_primary_key = 1) SET @command = N'ALTER INDEX ' + @name + N' ON ' + @tableName + N' REBUILD';
				--	ELSE SET @command = N'ALTER INDEX ' + @name + N' ON ' + @tableName + N' REORGANIZE';
				--ELSE SET @command = N'ALTER INDEX ' + @name + N' ON ' + @tableName + N' REBUILD';
					
				SET @command = N'ALTER INDEX ' + @name + N' ON ' + @tableName + N' REBUILD';
				EXEC (@command);
				PRINT N'Executed: ' + @command;

				SET @command = N'ALTER INDEX ' + @name + N' ON ' + @tableName + N' REORGANIZE';
				EXEC (@command);
				PRINT N'Executed: ' + @command;

			END
		
			FETCH NEXT FROM index_stats_cursor 
			INTO @object_id, @index_id, @name, @is_primary_key, @partition_number, @avg_fragmentation_in_percent;

		END
	
		CLOSE index_stats_cursor;
		DEALLOCATE index_stats_cursor;
		DROP TABLE #IndexStats;

	END TRY

	BEGIN CATCH
		THROW;
	END CATCH

