import datetime
import logging
import ftplib
import azure.functions as func

def main(mytimer: func.TimerRequest) -> None:
    files_to_save = ['nasdaqlisted.txt', 'otherlisted.txt']
    print(str(files_to_save))

    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()

    if mytimer.past_due:
        logging.info('The timer is past due!')

    logging.info('Python timer trigger function ran at %s', utc_timestamp)
    for file in files_to_save:
        save_file_to_blob(file)
    print('This is the Test Function')

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
        print("Successfully Moved the file " + file_name)
    except Exception as err:
        print("Error occurred while loading data to ADLS. Error Details ::" + str(err))

