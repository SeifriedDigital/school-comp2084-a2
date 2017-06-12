CREATE TABLE [dbo].[logs] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [authorId]      NVARCHAR (128) NOT NULL,
    [title]         VARCHAR (MAX)  NOT NULL,
    [notes]         TEXT           NULL,
    [assetId]       INT            NULL,
    [assetCallSign] VARCHAR (MAX)  NULL,
    [createdDate]   DATETIME       DEFAULT NOW() NULL,
    CONSTRAINT [PK_logs] PRIMARY KEY CLUSTERED ([Id] ASC)
);

