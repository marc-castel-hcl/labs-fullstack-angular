﻿CREATE TABLE [dimensions].[LOCATION]
(
	[L_ID] INT NOT NULL IDENTITY(1, 1),
	[L_COUNTRY_CODE] CHAR(2) NOT NULL, 
    [L_PROVINCE] NVARCHAR(50) NOT NULL,
	[L_NAME] NVARCHAR(50) NOT NULL, 
    [L_POPULATION_PERCENT] NUMERIC(5, 2) NOT NULL, 
    CONSTRAINT [PK_LOCATION] PRIMARY KEY ([L_ID]), 
    CONSTRAINT [AK_LOCATION] UNIQUE ([L_COUNTRY_CODE], [L_PROVINCE], [L_NAME]), 
    CONSTRAINT [CK_LOCATION_L_POPULATION_PERCENT] CHECK ([L_POPULATION_PERCENT] >= 0.00 AND [L_POPULATION_PERCENT] <= 100.00), 
    CONSTRAINT [FK_LOCATION_To_REGION] FOREIGN KEY ([L_COUNTRY_CODE]) REFERENCES [dimensions].[REGION]([R_COUNTRY_CODE]), 
)

GO

CREATE INDEX [IX_LOCATION_L_COUNTRY_CODE] ON [dimensions].[LOCATION] ([L_COUNTRY_CODE])

GO

CREATE INDEX [IX_LOCATION_L_PROVINCE] ON [dimensions].[LOCATION] ([L_PROVINCE])

GO

CREATE INDEX [IX_LOCATION_L_NAME] ON [dimensions].[LOCATION] ([L_NAME])

GO

CREATE INDEX [IX_LOCATION_L_POPULATION_PERCENT] ON [dimensions].[LOCATION] ([L_POPULATION_PERCENT])