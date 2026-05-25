/*
===============================================================================
Create Database and Data Warehouse Schemas
===============================================================================
Script Purpose:
    This script creates the 'DataWarehouse' database and initializes the
    warehouse architecture using three schemas:

    1. bronze -> Raw source data layer
    2. silver -> Cleaned and transformed data layer
    3. gold   -> Business-ready analytical layer

    The script first checks whether the database already exists.
    If it exists, the database will be dropped and recreated.

WARNING:
    Executing this script will permanently delete the existing
    'DataWarehouse' database along with all stored data.

    Ensure proper backups are taken before execution.
*/

USE master;
GO

-------------------------------------------------------------------------------
-- Check if database exists
-------------------------------------------------------------------------------
IF EXISTS
(
    SELECT 1
    FROM sys.databases
    WHERE name = 'DataWarehouse'
)
BEGIN

    PRINT 'Existing DataWarehouse database found.';
    PRINT 'Dropping existing database...';

    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;

    PRINT 'Database dropped successfully.';
END;
GO

-------------------------------------------------------------------------------
-- Create Database
-------------------------------------------------------------------------------
PRINT 'Creating DataWarehouse database...';

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-------------------------------------------------------------------------------
-- Create Schemas
-------------------------------------------------------------------------------
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

-------------------------------------------------------------------------------
-- Verification
-------------------------------------------------------------------------------
SELECT 
    name AS schema_name
FROM sys.schemas
WHERE name IN ('bronze','silver','gold');
GO
