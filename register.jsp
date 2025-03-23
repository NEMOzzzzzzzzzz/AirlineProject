<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <header>
        <div class="logo">
            <img src="icon.png" alt="Forza Airline's Logo">
            <h1><pre>   Forza Airlines</pre></h1>
        </div>
        <style>
            img {
                border-radius: 50px;
            }
        </style>
    </header>
    <div class="container">
        <h1>User Registration</h1>
        <form id="registrationForm" method="post" action="register.jsp">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" required>
            
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" required>
            
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required min="18">
            
            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required pattern="[0-9]{10}">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
            
            <button type="submit">Register</button>
        </form>

        <%
            // Database connection parameters
            String jdbcUrl = "jdbc:mysql://localhost:3306/airlinedb";
            String username = "root";
            String password = ""; 

            // Check if the form is submitted
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                int age = Integer.parseInt(request.getParameter("age"));
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String pass = request.getParameter("password");
                String confirmPass = request.getParameter("confirmPassword");

                // Validate password confirmation
                if (!pass.equals(confirmPass)) {
                    out.println("<p style='color:red;'>Passwords do not match!</p>");
                } else {
                    Connection connection = null;
                    PreparedStatement preparedStatement = null;

                    try {
                        // Load the JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish the connection
                        connection = DriverManager.getConnection(jdbcUrl, username, password);

                        // Insert user data into the database
                        String sql = "INSERT INTO details (first_name, last_name, age, email, phone, password) VALUES (?, ?, ?, ?, ?, ?)";
                        preparedStatement = connection.prepareStatement(sql);
                        preparedStatement.setString(1, firstName);
                        preparedStatement.setString(2, lastName);
                        preparedStatement.setInt(3, age);
                        preparedStatement.setString(4, email);
                        preparedStatement.setString(5, phone);
                        preparedStatement.setString(6, pass);

                        int rowsAffected = preparedStatement.executeUpdate();
                        if (rowsAffected > 0) {
                            out.println("<p style='color:green;'>Registration successful!</p>");
                        } else {
                            out.println("<p style='color:red;'>Registration failed!</p>");
                        }

                    } catch (SQLException e) {
                        e.printStackTrace();
                        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    } finally {
                        // Close resources
                        try {
                            if (preparedStatement != null) preparedStatement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        %>
    </div>

    <script src="script.js"></script>
</body>
</html>