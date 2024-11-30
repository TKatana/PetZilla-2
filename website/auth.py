from flask import Blueprint, render_template, request, flash, redirect, url_for, session
import mysql.connector
from datetime import datetime
from werkzeug.security import generate_password_hash, check_password_hash
from .models import get_db_connection
# def get_db_connection():
#     # Connect to the database
#     connection = mysql.connector.connect(
#         host="localhost",        # MySQL server (XAMPP is on localhost)
#         user="root",             # MySQL username (default root)
#         password="",             # MySQL password (default empty in XAMPP)
#         database="pet_zilla"    # The database you created in phpMyAdmin
#     )
   
#     return connection

auth = Blueprint('auth', __name__)

@auth.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')  # Corrected typo ('eamil' -> 'email')
        password = request.form.get('password')

        # Establish a connection to the database
        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)  # Use dictionary cursor for easier handling

        try:
            # Query to fetch the user by email
            cursor.execute("SELECT * FROM user WHERE email = %s", (email,))
            user = cursor.fetchone()  # Fetch the first matching record

            if user:
                # Verify the hashed password
                if check_password_hash(user['password'], password):
                    print('Login successful')  # Print to the terminal (can be removed later)
                    # You can set up the session here for the logged-in user
                    session['user_id'] = user['user_id']  # Store user_id in session (you can store other data as needed)
                    session['username'] = user['username']  # Store the username in session
                    session['email'] = user['email']  # Store the email in session
                    return redirect(url_for('views.home'))  # Redirect to the home page
                else:
                    flash('Incorrect password. Please try again.', category='error')
                    print('Incorrect password entered')
            else:
                flash('Email not found. Please sign up.', category='error')

        except mysql.connector.Error as err:
            flash(f"Database error: {err}", category='error')

        finally:
            cursor.close()
            conn.close()

    return render_template("login.html")

@auth.route('/logout')
def logout():
    session.clear()  # Clears all session data
    flash('You have been logged out.', category='success')
    return redirect(url_for('auth.login'))  # Redirect to the login page

@auth.route('/sign-up', methods=['GET', 'POST'])
def sign_up():
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        phone = request.form.get('phone')
        address = request.form.get('address')
        password1 = request.form.get('password1')
        password2 = request.form.get('password2')

        # Validate the passwords
        if password1 != password2:
            flash("Passwords don't match!", category='error')
        elif len(password1) < 7:
            flash('Password is too short', category='error')
        else:
            # Hash the password
            password_hash = generate_password_hash(password1, method='pbkdf2:sha256')

            # Get the database connection
            conn = get_db_connection()
            cursor = conn.cursor()

            try:
                # Create SQL query with placeholders
                query = '''
                    INSERT INTO user (username, email, password, phone, address, created_at)
                    VALUES (%s, %s, %s, %s, %s, %s)
                '''

                # Get current timestamp
                created_at = datetime.now()

                # Execute the query and commit the transaction
                cursor.execute(query, (username, email, password_hash, phone, address, created_at))
                conn.commit()

                # Flash success message and redirect to login page
                flash("Account created successfully!", category='success')
                print('Account created succeccfully!!')
                return redirect(url_for('auth.login'))
            except Exception as err:
                # Handle the error and rollback if something goes wrong
                flash(f"Error: {err}", category='error')
                conn.rollback()
            finally:
                # Close the cursor and the connection
                cursor.close()
                conn.close()

    # Render the sign-up form if the request method is GET
    return render_template('sign_up.html')


