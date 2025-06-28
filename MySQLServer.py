import mysql.connector
from dotenv import load_dotenv
import os
load_dotenv()

def connect_db():
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            user="root",
            password=os.getenv("DB_PASSWORD")
        )
        return connection

    except mysql.connector.Error as e:
        print(f"Error: {e}")

def create_database():
    try:
        connection = connect_db()
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        
        connection.commit()
        print("Database 'alx_book_store' created successfully!")
    except mysql.connector.Error as e:
        print(f"Error creating database: {e}")
create_database()