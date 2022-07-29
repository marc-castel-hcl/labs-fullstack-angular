/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

PRINT N'Executing script file .\Seed.REGION.sql ...';
:r .\Seed.REGION.sql	

PRINT N'Executing script file .\Seed.GIVEN_NAME.sql ...';
:r .\Seed.GIVEN_NAME.sql

PRINT N'Executing script file .\Seed.SURNAME.sql ...';
:r .\Seed.SURNAME.sql



