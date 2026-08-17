USE SupplyChainAnalytics;
GO

------------------------------------------------------------
-- ETL Run Header
------------------------------------------------------------

CREATE TABLE audit.ETL_Run
(
    RunID           UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
    StartTime       DATETIME2 NOT NULL,
    EndTime         DATETIME2 NULL,
    Status          VARCHAR(20) NOT NULL,
    StartedBy       SYSNAME NOT NULL DEFAULT SUSER_SNAME(),
    MachineName     SYSNAME NULL DEFAULT HOST_NAME(),
    RowsInserted    BIGINT DEFAULT 0,
    RowsUpdated     BIGINT DEFAULT 0,
    RowsDeleted     BIGINT DEFAULT 0,
    ErrorCount      INT DEFAULT 0,
    Notes           VARCHAR(500) NULL
);
GO

------------------------------------------------------------
-- Individual ETL Step Log
------------------------------------------------------------

CREATE TABLE audit.ETL_Step
(
    StepID          BIGINT IDENTITY PRIMARY KEY,
    RunID           UNIQUEIDENTIFIER NOT NULL,
    ProcedureName   SYSNAME NOT NULL,
    StepName        VARCHAR(100),
    StartTime       DATETIME2 NOT NULL,
    EndTime         DATETIME2 NULL,
    RowsProcessed   BIGINT DEFAULT 0,
    Status          VARCHAR(20),
    ErrorMessage    NVARCHAR(MAX) NULL
);
GO

------------------------------------------------------------
-- Error Log
------------------------------------------------------------

CREATE TABLE audit.ETL_Error
(
    ErrorID             BIGINT IDENTITY PRIMARY KEY,
    RunID               UNIQUEIDENTIFIER,
    ProcedureName       SYSNAME,
    ErrorNumber         INT,
    ErrorSeverity       INT,
    ErrorState          INT,
    ErrorLine           INT,
    ErrorMessage        NVARCHAR(MAX),
    ErrorDate           DATETIME2  DEFAULT SYSDATETIME()
);
GO