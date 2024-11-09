import mysql.connector
from fastapi import FastAPI, HTTPException
import logging
import os
# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Load environment variables

app = FastAPI()

def check_mysql_connection():
    try:
        cnx = mysql.connector.connect(
            user=os.environ.get("MYSQL_USER"),
            password=os.environ.get("MYSQL_PASSWORD"),
            host=os.environ.get("MYSQL_HOST"),
            database=os.environ.get("MYSQL_DATABASE")
        )
        if cnx.is_connected():
            cnx.close()
            return True
    except mysql.connector.Error as e:
        logger.error(f"Error connecting to MySQL: {e}")
        return False
    return False

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/db_check")
def check_db():
    if check_mysql_connection():
        return {"status": "connected"}
    else:
        return {"status": "disconnected"}
