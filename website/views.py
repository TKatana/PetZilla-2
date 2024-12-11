from flask import Blueprint, render_template, request, jsonify, redirect,url_for,flash, session
import os
import random
from .models import get_db_connection, save, grab
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

    query = "SELECT * FROM product"
    products = grab(query, None)





    return render_template("home.html",random_image=random_image, products=products, toys = products)


#add to cart function

@views.route("/add-to-cart", methods=["POST"])
def add_to_cart():
    if "user_id" not in session:
        flash('User login required to add product', category='error')
        return jsonify({"error": "Unauthorized"}), 401

    # Retrieve product data from request
    data = request.get_json()
    product_id = data.get("id")
    product_name = data.get("name")
    product_price = data.get("price")
    image_url = data.get("image_url")

    # Initialize cart in session if it doesn't exist
    if "cart" not in session:
        session["cart"] = []

    # Add product to cart
    cart = session["cart"]
    cart.append({"id": product_id, "name": product_name, "price": product_price, "product_img":image_url,"quantity": 1})
    session["cart"] = cart  # Update session

    return jsonify({"cart_count": len(cart)})





@views.route('/get_cart_count', methods=['GET'])
def get_cart_count():
    """Fetch the current cart count for the logged-in user."""
    user_id = session.get('user_id')

    if not user_id:
        # If user is not logged in, return error message with 401 status code
        return jsonify({'error': 'User not logged in'}), 401

    # Ensure 'cart' exists in session and user_id exists within the cart
    if 'cart' in session and user_id in session['cart']:
        return jsonify({'cart_count': len(session['cart'][user_id])})

    # If no cart or items are found, return a count of 0
    return jsonify({'cart_count': 0})



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
def view_cart():
    if "user_id" not in session:
        return redirect("/login")

    cart = session.get("cart", [])
    total_price = sum(float(item["price"]) * item.get("quantity", 1) for item in cart)

    return render_template("cart.html", cart=cart, total_price=total_price)


##

@views.route("/increment-cart", methods=["POST"])
def increment_cart():
    product_id = request.form.get("product_id")
    cart = session.get("cart", [])
    for item in cart:
        if str(item["id"]) == str(product_id):  # Match types explicitly
            item["quantity"] += 1
            break  # Stop after finding the item
    session["cart"] = cart
    return redirect("/cart")


@views.route("/decrement-cart", methods=["POST"])
def decrement_cart():
    product_id = request.form.get("product_id")
    cart = session.get("cart", [])
    for item in cart:
        if str(item["id"]) == str(product_id):
            if item["quantity"] > 1:
                item["quantity"] -= 1
            break  # Stop after finding the item
    session["cart"] = cart
    return redirect("/cart")



@views.route("/remove-cart-item", methods=["POST"])
def remove_cart_item():
    product_id = request.form.get("product_id")
    cart = session.get("cart", [])
    cart = [item for item in cart if str(item["id"]) != str(product_id)]  # Remove matching item
    session["cart"] = cart
    return redirect("/cart")




##


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
