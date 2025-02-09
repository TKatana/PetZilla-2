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
> python main.py
or
> flask run
```
- Open your browser and go to: [http://127.0.0.1:5000](http://127.0.0.1:5000)

---

## Screenshots
### Example UI Pages
### Home Page
![Home Page](https://i.ibb.co.com/JkY3fcD/Screenshot-2024-12-19-213217.png)

### Add New Product Page
![Add New Product Page](https://i.ibb.co.com/0hnbyB5/Screenshot-2024-12-19-213644-Copy.png)

### Cart Page
![Cart Page](https://i.ibb.co.com/RNBSXmt/image.png)

### Payment Page
![Payment Page](https://i.ibb.co.com/g4xGZjt/Screenshot-2024-12-21-014025.png)
### Admin Dashboard
![Admin Dashboard](https://www.google.com)

### New User Singup
![New User Singup](https://i.ibb.co.com/092WZyt/Screenshot-2024-12-19-213530.png)

### Login Page
![Login Page](https://i.ibb.co.com/gyPHmyY/Screenshot-2024-12-19-213507.png)

### Admin Login
![Admin Login](https://i.ibb.co.com/mTJnKJj/Screenshot-2024-12-19-213544.png)

### Vet Appointment
![Vet Appointment](https://i.ibb.co.com/zN6g4d6/image.png)


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
├── main.py
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

