# PetZilla

Welcome to **Petzilla**! PetZilla is an online platform where users can purchase pet-related items and manage their purchases through an efficient admin dashboard. Built with a user-friendly interface and scalable architecture, PetZilla is designed to cater to all pet enthusiasts.

---

## Features

### 1. **User Experience**
- **Home Page**: Accessible without logging in.
- **User Registration**: Users can sign up by providing their name, email, phone number, address, and password.
- **User Login**: Secure login system using email and password.

### 2. **Shopping Features**
- **Dynamic Cart**: Add items to a cart that dynamically updates.
- **Order Placement**: Users can confirm orders with options to select a delivery address and payment method ("Bkash" or "Cash on Delivery").
- **Product Categories**: Products are grouped into categories like food, toys, and medicine for various pets (dogs, cats, birds, rabbits, and hamsters).

### 3. **Admin Dashboard**
- **Add Products**: Admins can add new products with details like name, price, description, category, and image.
- **Order History**: View a detailed list of customer orders, including payment details and transaction history.
- **Product Management**: Dynamically fetch and display products by category.

---

## Tech Stack
- **Frontend**: Tailwind CSS, Bootstrap, JavaScript, HTML5, CSS3
- **Backend**: Python Flask
- **Database**: MySQL

---

## User Manual

### Prerequisites
- Python 3.8+
- MySQL Server
- Flask Framework
- Pip (Python package manager)
- A web browser (to test locally)

### Installation Steps

#### 1. **Clone the Repository**
```cmd
> git clone https://github.com/TKatana/PetZilla-2.git
> cd petzilla-2
```

#### 2. **Set Up Virtual Environment**
```cmd
> python -m venv env
> env\Scripts\activate
```

#### 3. **Install Dependencies**
```cmd
> pip install -r requirements.txt
```

#### 4. **Database Configuration**
- Create a MySQL database named `petzilla`.
- Import the database schema using:
```cmd
> mysql -u root -p petzilla < schema/schema.sql
```
- Update the database credentials in the `website/models.py` file:
```python
host="localhost",
user="root",
password="your password",
database="pet_zilla"
```

#### 5. **Run the Application**
```cmd
> flask run
or
> python main.py
```
- Open your browser and go to: [http://127.0.0.1:5000](http://127.0.0.1:5000)



---

## Project Structure
```
petzilla-2/
├── website/
│   ├── static/
│   │   ├── css/
│   │   ├── img/
│   │   ├── js/
│   ├── templates/
│   │   └── new_listing.html
│   ├── models.py
│   ├── auth.py
│   ├── views.py
│   ├── __init__.py
│   └── helper.py
├── app.py
├── schema/
│   └── schema.sql
```

---

## Future Enhancements
- Adding a blog feature for pet owners to share experiences.
- Enhancing the search functionality for products.
- Implementing advanced analytics in the admin dashboard.

---

## Contact
For inquiries, please contact [here](mailto:srk@khan.com).

---

## License
This project is licensed under the [MIT License](LICENSE).

