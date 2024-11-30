import mysql.connector
from flask import current_app

def get_db_connection():
    # Connect to the database
    connection = mysql.connector.connect(
        host="localhost",        # MySQL server (XAMPP is on localhost)
        user="root",             # MySQL username (default root)
        password="",             # MySQL password (default empty in XAMPP)
        database="pet_zilla"    # The database you created in phpMyAdmin
    )
   
    return connection
