def get_nasdaq_data(file_name):
    from ftplib import FTP
    from io import BytesIO
    nasdaq_ftp_url = 'ftp.nasdaqtrader.com'
    nasdaq_folder = 'SymbolDirectory'
    try:
        ftp = FTP(nasdaq_ftp_url)
        ftp.login()
        ftp.cwd(nasdaq_folder)
        contents = BytesIO()
        print("Retreving Contents Data ::" + str(contents))
        ftp.retrbinary('RETR '+file_name  , contents.write)
        print(" Contents Data Retrived" )
        contents.seek(0)
        ftp.quit()
        return contents 
    except Exception as err:
        print("Error occurred while fetching the data from nasdaq for the file " + file_name +". Error Details ::" + str(err))

def save_file_to_blob(file_name):
    from azure.storage.blob import BlockBlobService, PublicAccess
    container_name = 'stockrawdata'
    storage_name = 'stockanalysisadls'
    #
    try:
        block_blob_service = BlockBlobService(account_name=storage_name, account_key='mDmjRCgeoaxYtLf69kXRUVj6PO9gZq4e/1/LHyU4aqMFaOC1AusTRCH4l5ApJDSjNzA1fQAkDviuSLIkII1a2g==')
        block_blob_service.create_blob_from_stream(container_name,'raw/nasdaq/'+file_name,get_nasdaq_data(file_name))
    except Exception as err:
        print("Error occurred while loading data to ADLS. Error Details ::" + str(err))

if __name__ == "__main__":
    save_file_to_blob("nasdaqlisted.txt")
