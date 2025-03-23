<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: gray;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .form-group input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 16px;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group input[type="reset"] {
            background-color: #f44336;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 16px;
        }

        .form-group input[type="reset"]:hover {
            background-color: #da190b;
        }

        .form-group input[type="button"] {
            background-color: #ffa500;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 16px;
            margin-top: 10px;
        }

        .form-group input[type="button"]:hover {
            background-color: #e69500;
        }

        .error-message {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form action="db.jsp" method="POST">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="confirm-password">Confirm Password:</label>
                <input type="password" id="confirm-password" name="confirm-password" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number:</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Login"style="background-color:black">
            
                 
            </div>

            <!-- Error messages can go here -->
            <div class="error-message">
                <!-- Example: <p>Invalid username or password.</p> -->
            </div>
        </form>
    </div>

    <script>
        function updateData() {
            // Send an AJAX request to update the data in the DB
            let username = document.getElementById('username').value;
            let email = document.getElementById('email').value;
            let password = document.getElementById('password').value;
            let phone = document.getElementById('phone').value;

            // Make sure all fields are filled in
            if (!username || !email || !password || !phone) {
                alert("All fields are required for updating data.");
                return;
            }

            // Make an AJAX request to update the data
            let xhr = new XMLHttpRequest();
            xhr.open("POST", "updateUser.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    alert("Data updated successfully!");
                }
            };

            xhr.send("username=" + username + "&email=" + email + "&password=" + password + "&phone=" + phone);
        }

        function deleteData() {
            // Send an AJAX request to delete the user from the database
            let username = document.getElementById('username').value;

            if (!username) {
                alert("Username is required to delete data.");
                return;
            }

            // Make an AJAX request to delete the data
            let xhr = new XMLHttpRequest();
            xhr.open("POST", "deleteUser.jsp", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    alert("User deleted successfully!");
                }
            };

            xhr.send("username=" + username);
        }
    </script>
</body>
</html>
