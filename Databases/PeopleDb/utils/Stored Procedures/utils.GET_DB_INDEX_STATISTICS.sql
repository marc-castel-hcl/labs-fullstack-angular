CREATE PROCEDURE [utils].[GET_DB_INDEX_STATISTICS]
AS
	SET NOCOUNT ON;

	DECLARE @dbName sysname = DB_NAME();
	DECLARE @dbId smallint = DB_ID(@dbName);

	BEGIN TRY
		SELECT  
			 IDX_STATS.[object_id] 'table_id'
			,IDX_STATS.[index_id]
			,IDX.[name] AS 'index_name'
			,IDX_STATS.[partition_number]
			,IDX_STATS.[avg_fragmentation_in_percent]
		INTO #IndexInfo
		FROM [sys].[dm_db_index_physical_stats](@dbId, NULL, NULL, NULL, 'LIMITED') IDX_STATS
		INNER JOIN [sys].[indexes] IDX ON IDX.[object_id] = IDX_STATS.[object_id] AND
										IDX.[index_id] = IDX_STATS.[index_id]

		SELECT 
			  S.[schema_id]
			 ,T.[object_id] 'table_id'
			 ,S.[name] 'schema_name'
			 ,T.[name] 'table_name'
		INTO #TableInfo
		FROM [sys].[tables] T
		INNER JOIN [sys].[schemas] S ON [T].[schema_id] = [S].[schema_id]
		WHERE T.[is_ms_shipped] = 0 AND T.[type] = 'U' AND
			  T.[name] NOT IN (N'__RefactorLog', N'sysdiagrams');
		

		SELECT
			  #TableInfo.[schema_id]
			, #TableInfo.[table_id]
			, #TableInfo.[schema_name]
			, #TableInfo.[table_name] 
			, #IndexInfo.[index_id]
			, #IndexInfo.[index_name]
			, #IndexInfo.[partition_number]
			, #IndexInfo.[avg_fragmentation_in_percent]
		FROM #TableInfo 
		INNER JOIN #IndexInfo ON #TableInfo.[table_id] = #IndexInfo.[table_id]
		ORDER BY #TableInfo.[schema_name], #TableInfo.[table_name], #IndexInfo.[index_id];

		DROP TABLE #IndexInfo;
		DROP TABLE #TableInfo;

	END TRY

	BEGIN CATCH
		THROW;
	END CATCH
