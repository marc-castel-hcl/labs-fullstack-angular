﻿CREATE TABLE [dimensions].[REGION_CURRENCY]
(
	[RC_ID] INT IDENTITY(1, 1),
	[RC_COUNTRY_CODE] CHAR(2) NOT NULL, 
	[RC_SYMBOL] NVARCHAR(5) NOT NULL, 
	[RC_ISO_SYMBOL] CHAR(3) NOT NULL, 
	[RC_ENGLISH_NAME] VARCHAR(50) NOT NULL, 
	[RC_NATIVE_NAME] NVARCHAR(50) NOT NULL, 
    CONSTRAINT [PK_RegionCurrency] PRIMARY KEY ([RC_ID]), 
    CONSTRAINT [FK_REGION_CURRENCY_TO_REGION] FOREIGN KEY ([RC_COUNTRY_CODE]) REFERENCES [dimensions].[REGION]([R_COUNTRY_CODE]), 
)
GO


CREATE INDEX [IX_REGION_CURRENCY_RC_COUNTRY_CODE] ON [dimensions].[REGION_CURRENCY] ([RC_COUNTRY_CODE])

GO

CREATE INDEX [IX_REGION_CURRENCY_RC_SYMBOL] ON [dimensions].[REGION_CURRENCY] ([RC_SYMBOL])

GO

CREATE INDEX [IX_REGION_CURRENCY_RC_ISO_SYMBOL] ON [dimensions].[REGION_CURRENCY] ([RC_ISO_SYMBOL])

GO

CREATE INDEX [IX_REGION_CURRENCY_RC_ENGLISH_NAME] ON [dimensions].[REGION_CURRENCY] ([RC_ENGLISH_NAME])

GO

CREATE INDEX [IX_REGION_CURRENCY_RC_NATIVE_NAME] ON [dimensions].[REGION_CURRENCY] ([RC_NATIVE_NAME])

GO


CREATE UNIQUE INDEX [UIX_REGION_CURRENCY] ON [dimensions].[REGION_CURRENCY] ([RC_COUNTRY_CODE], [RC_SYMBOL], [RC_ISO_SYMBOL], [RC_ENGLISH_NAME], [RC_NATIVE_NAME])
