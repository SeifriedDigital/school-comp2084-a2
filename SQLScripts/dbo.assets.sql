CREATE TABLE [dbo].[assets] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [authorId]      NVARCHAR (128) NOT NULL,
    [callSign]      VARCHAR (MAX)  NOT NULL,
    [brand]         VARCHAR (MAX)  NULL,
    [year]          INT       NULL,
    [model]         VARCHAR (MAX)  NULL,
    [vin]           VARCHAR (MAX)  NULL,
    [hours]         INT            NULL,
    [odometerUnit]  INT            NULL,
    [odometer]      INT            NULL,
    [purchasedDate] DATE           NULL,
    [pricePaid]     MONEY          NULL,
    [notes]         TEXT           NULL,
    [createdDate]   DATE           DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_assets] PRIMARY KEY CLUSTERED ([Id] ASC)
);

