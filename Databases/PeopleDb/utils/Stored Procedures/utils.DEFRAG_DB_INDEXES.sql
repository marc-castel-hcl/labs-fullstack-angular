CREATE PROCEDURE [utils].[DEFRAG_DB_INDEXES]
	@limit FLOAT = 5.0
AS

	SET NOCOUNT ON;

	DECLARE @schemaName SYSNAME;
	DECLARE @tableName SYSNAME;
	DECLARE @fullTableName SYSNAME;

	BEGIN TRY
		
		DECLARE table_cursor CURSOR FOR 
			SELECT 
				  S.[name] 'schema_name'
				 ,T.[name] 'table_name'
			FROM [sys].[tables] T
			INNER JOIN [sys].[schemas] S ON [T].[schema_id] = [S].[schema_id]
			WHERE T.[is_ms_shipped] = 0 AND T.[type] = 'U' AND 
				  T.[name] NOT IN (N'__RefactorLog', N'sysdiagrams');

		OPEN table_cursor;

		FETCH NEXT FROM table_cursor INTO @schemaName, @tableName;

		WHILE (@@FETCH_STATUS = 0)
		BEGIN

			SET @fullTableName = CONCAT(@schemaName, N'.', @tableName);

			EXEC [utils].[DEFRAG_TABLE_INDEXES] @limit, @fullTableName;

			FETCH NEXT FROM table_cursor INTO @schemaName, @tableName;

		END

		CLOSE table_cursor;
		DEALLOCATE table_cursor;

	END TRY

	BEGIN CATCH
		THROW;
	END CATCH
