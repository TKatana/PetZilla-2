from flask import Blueprint, render_template, request, jsonify
import os
import random
from .models import get_db_connection 

views = Blueprint('views', __name__)
# Path to the images directory (this assumes you have a folder 'static/img/banner')
images_dir = os.path.join(views.root_path, 'static', 'img', 'banner')
mfp_img = os.path.join(views.root_path, 'static', 'img', 'mfp')
@views.route('/')
def home():
    valid_extensions = ['jpg', 'jpeg', 'png', 'gif']
    images = [f for f in os.listdir(images_dir) if f.split('.')[-1].lower() in valid_extensions]
    random_image = random.choice(images)





    return render_template("home.html",random_image=random_image)


@views.route('/userinfo')
def userinfo():
    # Get a connection to the MySQL database
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    # Query to fetch data (replace 'user' with your actual table name)
    cursor.execute('SELECT * FROM user')
    
    # Fetch all rows
    rows = cursor.fetchall()
    
    # Print the rows to the terminal (this will print as a list of dictionaries)
    
    
    # Close cursor and connection
    cursor.close()
    conn.close()

    # Return the rows as a JSON response
    return jsonify(rows)  # This returns the rows in JSON format

    # Optionally, render a template if you still want to render a webpage
    # return render_template('userinfo.html', data=rows)




@views.route('/cart')
def cart():
    return render_template('cart.html')

@views.route('/appiontment')
def appointment():
    return render_template('vetAppintment.html')

@views.route('/blog')
def blog():
    return render_template('pet_blog.html')