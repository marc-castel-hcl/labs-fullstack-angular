CREATE TABLE [dimensions].[GIVEN_NAME]
(
	[GN_ID] INT IDENTITY(1, 1) NOT NULL,
	[GN_COUNTRY_CODE] CHAR(2) NOT NULL, 
    [GN_NAME] NVARCHAR(50) NOT NULL, 
    [GN_IS_FEMALE] BIT NOT NULL, 
    CONSTRAINT [PK_GIVEN_NAME] PRIMARY KEY ([GN_ID]), 
    CONSTRAINT [AK_GIVEN_NAME] UNIQUE ([GN_COUNTRY_CODE], [GN_NAME], [GN_IS_FEMALE]), 
    CONSTRAINT [FK_GIVEN_NAME_TO_REGION] FOREIGN KEY ([GN_COUNTRY_CODE]) REFERENCES [dimensions].[REGION]([R_COUNTRY_CODE]) 
)

GO

CREATE INDEX [IX_GIVEN_NAME_GN_COUNTRY_CODE] ON [dimensions].[GIVEN_NAME] ([GN_COUNTRY_CODE])

GO

CREATE INDEX [IX_GIVEN_NAME_GN_NAME] ON [dimensions].[GIVEN_NAME] ([GN_NAME])

GO

CREATE INDEX [IX_GIVEN_NAME_GN_IS_FEMALE] ON [dimensions].[GIVEN_NAME] ([GN_IS_FEMALE])
