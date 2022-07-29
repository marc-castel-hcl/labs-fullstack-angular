CREATE PROCEDURE [utils].[GET_TABLE_INDEX_STATISTICS]
	@tableName SYSNAME
AS
	SET NOCOUNT ON;
	BEGIN TRY
		DECLARE @dbName sysname = DB_NAME();
		DECLARE @dbId smallint = DB_ID(@dbName);
		DECLARE @objectId int = OBJECT_ID(@tableName); 

		SELECT  
			IDX_STATS.index_id
			,IDX.name
			,IDX_STATS.partition_number
			,IDX_STATS.avg_fragmentation_in_percent
		FROM sys.dm_db_index_physical_stats(@dbId, @objectId, null, null, 'limited') IDX_STATS
		INNER JOIN sys.indexes IDX ON IDX.object_id = IDX_STATS.object_id and
										IDX.index_id = IDX_STATS.index_id
		WHERE IDX_STATS.index_id > 0
		ORDER BY IDX_STATS.index_id, IDX_STATS.partition_number, IDX_STATS.avg_fragmentation_in_percent;

	END TRY

	BEGIN CATCH
		THROW;
	END CATCH
