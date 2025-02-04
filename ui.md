# PetZilla

Welcome to **Petzilla**! PetZilla is an online platform designed to make pet care easier by offering a seamless shopping experience and user-friendly admin management.

---

## Features
### 1. **User Features**
- Browse and purchase pet-related products.
- Add products to a dynamic shopping cart.
- Confirm orders with secure payment options.

### 2. **Admin Dashboard**
- Add and manage products with ease.
- View and track order history.
- Update product inventory dynamically.

---

## User Interface

### Home Page
![Home Page](https://i.ibb.co.com/JkY3fcD/Screenshot-2024-12-19-213217.png)

### Add New Product Page
![Add New Product Page](https://i.ibb.co.com/0hnbyB5/Screenshot-2024-12-19-213644-Copy.png)

### Cart Page
![Cart Page](https://i.ibb.co.com/RNBSXmt/image.png)

### Payment Page
![Payment Page](https://i.ibb.co.com/g4xGZjt/Screenshot-2024-12-21-014025.png)
### Admin Dashboard
![Admin Dashboard](##)

### New User Singup
![New User Singup](https://i.ibb.co.com/092WZyt/Screenshot-2024-12-19-213530.png)

### Login Page
![Login Page](https://i.ibb.co.com/gyPHmyY/Screenshot-2024-12-19-213507.png)

### Admin Login
![Admin Login](https://i.ibb.co.com/mTJnKJj/Screenshot-2024-12-19-213544.png)

---

## Tech Stack
- **Frontend**: Tailwind CSS, Bootstrap, JavaScript
- **Backend**: Flask (Python)
- **Database**: MySQL

---

## How to Run Locally

### Prerequisites
- Python 3.8+
- MySQL Server
- Flask Framework

### Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/petzilla.git
    cd petzilla-2
    ```

2. Set up a virtual environment:
    ```bash
    python -m venv env
    env\Scripts\activate  # For Windows
    ```

3. Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```

4. Set up the database:
    - Create a database named `petzilla`.
    - Import the schema:
        ```bash
        mysql -u root -p petzilla < schema/schema.sql
        ```

5. Run the application:
    ```bash
    flask run
    ```

6. Open [http://127.0.0.1:5000](http://127.0.0.1:5000) in your browser.

---

## Screenshots
### Example UI Pages
- **Home Page**:
  ![Home Page](static/img/home_page.png)
- **Cart Page**:
  ![Cart Page](static/img/cart_page.png)
- **Admin Dashboard**:
  ![Admin Dashboard](static/img/admin_dashboard.png)

---

## Contact
For inquiries, reach out to [yourname](mailto:yourname@example.com).
