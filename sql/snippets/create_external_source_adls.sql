--- The script is for Creating the External Data table on top of ADLS. 
-- 1st Create the master key encryption 
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '$Tock@Naly$y$I$'

GO
-- Create the scoped Credential 
CREATE DATABASE SCOPED CREDENTIAL NasdaqStockFilesAccess
WITH
   IDENTITY = 'SHARED ACCESS SIGNATURE',
   SECRET = 'tKhxUaZy87KhKpL9l7L5cs%2FDNZulBttunHzYMCOcFwg%3D'

--- Create the external Data source 

CREATE EXTERNAL DATA SOURCE NasdaqStockFileSource
WITH
(    LOCATION   = 'https://stockanalysisadls.blob.core.windows.net/stockrawdata/raw/nasdaq'
,    CREDENTIAL = NasdaqStockFilesAccess
,    TYPE       = BLOB_STORAGE
)





