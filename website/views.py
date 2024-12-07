from flask import Blueprint, render_template, request, jsonify, redirect,url_for,flash
import os
import random
from .models import get_db_connection, save
from .helper import check_is_float_and_convert, upload_image_to_imgbb
from base64 import b64encode

views = Blueprint('views', __name__)
MAX_IAMGE_SIZE = 512 * 1024
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

category_list = [
    "cat-food",
    "dog-food",
    "bird-food",
    "cat-medicine",
    "dog-medicine",
    "rabbit-medicine",
    "bird-medicine",
    "hamster-medicine"
]


@views.route('/cart')
def cart():
    return render_template('cart.html')

@views.route('/appiontment')
def appointment():
    return render_template('vetAppintment.html')

@views.route('/blog')
def blog():
    return render_template('pet_blog.html')


@views.route('/adminDashboard', methods=['GET','POST'])
def adminDashboard():
    if request.method == 'GET':
        return render_template("adminDashboard.html")
    if request.method == 'POST':
        name = request.form.get("productName", None)
        category = request.form.get('productCategory', None)
        description = request.form.get('description', None)
        stock = request.form.get('quantity', None)
        price = request.form.get('price', None)
        image = request.files.get('product_img', None)

        price = check_is_float_and_convert(price)
        print(f"Price of product is: {price}")
        if not price:flash("TODO:")
        if image:
            print("yes this is a image")
            if image.mimetype not in ["image/jpeg", "image/png","image/jpg"]:
                print("image mimtype is not defined")
                flash("TODO:")
            if len(image.read()) > MAX_IAMGE_SIZE:
                print("image size is more than 512KB")
                flash("image size extends 512kb.")
            image.seek(0)
            img_byts = image.read()
            image_url = upload_image_to_imgbb(b64encode(img_byts))
            print("succeessfullyt uploaded image file ti image bb.")
            
        else:
            image_url = ""
            return jsonify({"error": "image bb kaj kore nai"}), 400
        # Sanitize and validate inputs
        if not name or not category or not description or not price or not stock or not image_url or not description:
            print(image_url)
            flash("All fields are required", "error")
            return redirect(request.referrer)
            # return jsonify({"error": "All fields are required"}), 400
        print(image_url)
        save("INSERT INTO product (name, category, description, price, stock, product_img) VALUES (%s, %s, %s, %s, %s, %s)",(name, category, description, price, stock, image_url ))
    

    return render_template("adminDashboard.html")
