import mysql.connector
from flask import current_app, flash, jsonify


def get_db_connection():
    # Connect to the database
    connection = mysql.connector.connect(
        host="localhost",        # MySQL server (XAMPP is on localhost)
        user="root",             # MySQL username (default root)
        password="",             # MySQL password (default empty in XAMPP)
        database="pet_zilla"    # The database you created in phpMyAdmin
    )
   
    return connection


def save(query, data):
    # Connect to MySQL and insert the product into the database
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute(query, data)  # Execute the query with the provided values
        conn.commit()  # Commit the transaction to the database
        print("Product added successfully", "success")
        flash("Product added successfully", "success")
        return jsonify({"message": "Product added successfully"}), 201
    except mysql.connector.Error as err:
        print(f"Database error: {err}")
        conn.rollback()  # Rollback in case of error
        
        flash(f"Database error: {err}", "error")
        return jsonify({"error": str(err)}), 500
    finally:
        cursor.close()
        conn.close()

    return True


def get(query, data):
    # This function assumes get_db_connection is defined to return a connection object
    connection = get_db_connection()
    cur = connection.cursor()
    cur.execute(query, data)
    result = cur.fetchall()
    connection.close()
    return result