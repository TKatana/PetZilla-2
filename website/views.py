from flask import Blueprint, render_template, request, jsonify, redirect,url_for,flash, session, send_from_directory
import os
import random
from .models import db, save, grab
from .helper import check_is_float_and_convert, upload_image_to_imgbb
from base64 import b64encode
import mysql.connector
# from . import views
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
    products = products[::-1]
    medicine = grab("SELECT * FROM product WHERE category LIKE '%medicine%'",None)
    toys = grab("SELECT * FROM product WHERE category LIKE '%toy%'",None)
    foods = grab("SELECT * FROM product WHERE category like '%food%'", None)
    return render_template("home.html",random_image=random_image, products=products, toys=toys, medicine=medicine, foods=foods)


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
    conn = db()
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
    # Iterate through the cart to find and update the item
    cart = [
        item for item in cart if not (
            str(item["id"]) == str(product_id) and 
            item["quantity"] == 1
        )
    ]
    for item in cart:
        if str(item["id"]) == str(product_id):
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
    if 'unique_key' not in session:
        flash('You must be logged in to view this page', category='error')
        return redirect(url_for('auth.adminlogin'))
    # if request.method == 'GET':
    try:
        conn = db()
        cursor = conn.cursor(dictionary=True)
        # Query to get sell/order information
        query = """
            SELECT o.order_id AS order_id, 
                    u.username AS customer_name, 
                    u.phone AS customer_phone, 
                    u.email AS customer_email,
                    o.payment_method,
                    o.transaction_id
            FROM orders o
            INNER JOIN user u ON o.user_id = u.user_id
            ORDER BY o.order_id ASC;
        """
        cursor.execute(query)
        orders = cursor.fetchall()
    except Exception as e:
        print(f"Error fetching orders: {e}")
        orders = []
    finally:
        cursor.close()
        conn.close()

        # return render_template("adminDashboard.html", orders=orders)
        
    
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
    return render_template("adminDashboard.html", orders=orders)





@views.route("/place-order", methods=["POST"])
def place_order():
    user_id = session.get("user_id")
    if not user_id:
        flash("You mast be loffed in to place an order.","error")
        return redirect(url_for("views.login"))
    
    name = request.form.get("name")
    address = request.form.get("address")
    payment_method = request.form.get('payment_method', 'COD')
    transaction_id = request.form.get('transaction_id', None)  # Optional field for Bkash
    cart = session.get("cart", [])
    total_price = sum(item["quantity"] * item["price"] for item in cart)
    delivery_fee = 35
    tax = round(total_price * 0.04, 2)
    total = round(total_price + delivery_fee + tax, 2)
    print(f"Payment Method: {payment_method}, Transaction ID: {transaction_id}")
    # Validate transaction_id if payment method is Bkash
    if payment_method == "Bkash" and not transaction_id:
        flash("Transaction ID is required for Bkash payments.", "error")
        return redirect(url_for("views.view_cart"))  # Redirect back to cart page with an error message
     # Insert order into the database
    
    try:
        conn = db()  # Use your custom `db` function to get the connection
        cursor = conn.cursor()

        # Insert into the orders table
        insert_order_query = """
            INSERT INTO orders (user_id, name, address, payment_method, transaction_id, total_amount)
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        cursor.execute(insert_order_query, (user_id, name, address, payment_method, transaction_id if payment_method == "Bkash" else None, total))

        order_id = cursor.lastrowid  # Get the inserted order's ID

        # Insert each cart item into the order_items table
        insert_item_query = """
            INSERT INTO order_items (order_id, product_id, quantity, price)
            VALUES (%s, %s, %s, %s)
        """
        for item in cart:
            cursor.execute(insert_item_query, (order_id, item["id"], item["quantity"], item["price"]))

        conn.commit()

        # Clear the cart after placing the order
        session["cart"] = []

    except Exception as e:
        conn.rollback()
        print(f"Error: {e}")
        return "An error occurred while processing your order.", 500

    finally:
        cursor.close()
        conn.close()
    
    # Process the order (example: save to a database or print to console)
    order_details = {
        "name": name,
        "address": address,
        "payment_method": payment_method,
        "transaction_id": transaction_id,
        "cart": cart,
        "total": total
    }
    
    print("Order Details:", order_details)  # Replace with database saving logic

    # Clear the cart after placing the order
    session["cart"] = []

    # Render the order confirmation page
    return render_template(
        "order_confirmation.html",
        name=name,
        address=address,
        total=total,
        payment_method=payment_method,
        transaction_id=transaction_id
    )




@views.route("/order-confirmation")
def order_confirmation():
    name = session.get("user_name", "Customer")
    address = session.get("shipping_address", "No address provided")
    total = session.get("total_price", 0)
    return render_template("order_confirmation.html", name=name, address=address, total=total)
