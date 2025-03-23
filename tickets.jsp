<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airline Booking Form</title>
    <link rel="icon" type="image/png" sizes="16 x16" href="icon.png">
    <link rel="stylesheet" href="style111.css">
</head>
<body>
<div class="booking-form">
  <form action="#" method="post">
    <h2 class="sub-heading">Booking Airplane Ticket</h2>
    <div class="main-flex">
      <div class="field form-text1">
        <select class="form-control">
                  <option>From</option>
                  <option value="Banglore">Banglore (Kempegowda International Airport)</option>
                  <option value="Kochi">Kochi (Cochin International Airport)</option>
                  <option value="Chennai">Chennai (Madras International Meenambakkam Airport)</option>
                  <option value="Hyderabad">Hyderabad (Rajiv Gandhi International Airport)</option>
                  <option value="Mumbai">Mumbai (Chhatrapati Shivaji International Airport)</option>
                  <option value="Delhi">Delhi (Indira Gandhi International Airport)</option>
        </select>
      </div>
      <div class="field form-text2">
        <select class="form-control">
                  <option>To</option>
                  <option value="France">France (Paris Charles de Gaulle Airport)</option>
                  <option value="Dubai">Dubai (Dubai International Airport)</option>
                  <option value="Australia">Australia (Tullamarine Airport)</option>
                  <option value="London">London (Heathrow Airport)</option>
                  <option value="Singapore">Singapore (Changi International Airport)</option>
                  <option value="New York">New York (John F. Kennedy International Airport)</option>
        </select>
      </div>
    </div>
    <div class="main-flex">
      <div class="field form-text1">
        <select class="form-control">
                  <option>Preferred Airline</option>
                  <option value="Air India">Air India</option>
                  <option value="Delta Airlines">Delta Airlines</option>
                  <option value="Indigo">Indigo</option>
                  <option value="SpiceJet">SpiceJet</option>
                  <option value="Southwest Airlines">Southwest Airlines</option>
                </select>
      </div>
      <div class="field form-text2">
        <select class="form-control">
                  <option>Preferred Seating</option>
                  <option value="Window">Window</option>
                  <option value="Aisle">Aisle</option>
                  <option value="Special">Special (Request note below)</option>
                </select>
      </div>
    </div>
    <div class="main-flex">
    <div class="field form-text1">
        <input id="datepicker" name="departureDate" type="date" required class="hasDatepicker">
    </div>
    <div class="field form-text2">
        <label for="timepicker"><pre>		Departure Time:</pre></label>
        <input type="time" id="timepicker" name="departureTime" class="field form-control" required>
    </div>
</div>

    <div class="triple-wthree">
      <div class="field form-text11">
        <select class="form-control">
                      <option value="">Adult(12+ Yrs)</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5+</option>
                    </select>
      </div>
      <div class="field form-text22">
        <select class="form-control">
                      <option value="">Children(2-11 Yrs)</option>
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5+</option>
                    </select>
      </div>
      <div class="field form-text33">
        <select class="form-control">
                      <option value="">Infant(under 2Yrs)</option>
                      <option value="0">0</option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5+</option>
                    </select>
      </div>
    </div>
    <div class="radio-section">
      <h6 style="text-shadow: 2px 2px 2px rgb(126, 81, 199);">Select your Fare</h6>
      <ul class="radio-buttons">
        <li>
          <input type="radio" id="a-option" name="selector1">
          <label for="a-option">One Way</label>
          <div class="check"></div>
        </li>
        <li>
          <input type="radio" id="b-option" name="selector1">
          <label for="b-option">Round-Trip</label>
          <div class="check">
            <div class="inside"></div>
          </div>
        </li>
      </ul>
      <div class="clear"></div>
    </div>
    <div class="main-flex">
    	<div class="field form-text1">
        	<input id="datepicker" name="returnDate" type="date" required class="hasDatepicker">
    	</div>
    	<div class="field form-text2">
        	<label for="timepicker"><pre>		Return Time:</pre></label>
        	<input type="time" id="timepicker" name="returnTime" class="field form-control" required>
    	</div>
    </div>
    <div class="field form-text">
      <textarea name="Message" placeholder="Any Message..." class="textarea"></textarea>
    </div>
    <h3 class="sub-heading">Personal Details</h3>
    <div class="main-flex">
      <div class="field form-text1">
        <input type="text" name="Name" placeholder="Full Name" required="">
      </div>
      <div class="field form-text2">
        <input type="text" name="Phone no" placeholder="Phone Number" required="">
      </div>
    </div>
    <div class="field form-text">
      <input type="email" name="Email" placeholder="Email" required="">
    </div>
    <div class="clear"></div>
    <input type="submit" value="Submit">
    <input type="reset" value="Clear Form">
    <div class="clear"></div>
  </form>
</div>
<%
    // Database connection parameters
    String driver = "com.mysql.cj.jdbc.Driver"; // Or your database driver
    String url = "jdbc:mysql://localhost:3306/airlinedb"; // Replace with your database URL
    String username = "root"; // Replace with your database username
    String password = ""; // Replace with your database password

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        // Load the database driver
        Class.forName(driver);

        // Establish the database connection
        connection = DriverManager.getConnection(url, username, password);

        // Retrieve form data
        String fromLocation = request.getParameter("from");
        String toLocation = request.getParameter("to");
        String airline = request.getParameter("airline");
        String seating = request.getParameter("seating");
        String departureDate = request.getParameter("Text");
        String departureTime = request.getParameter("Time");
        String adults = request.getParameter("adults");
        String children = request.getParameter("children");
        String infants = request.getParameter("infants");
        String fareType = request.getParameter("selector1"); // Assuming selector1 is the radio button name
        String returnDate = request.getParameter("returnDate");
        String returnTime = request.getParameter("returnTime");
        String message = request.getParameter("Message");
        String fullName = request.getParameter("Name");
        String phoneNumber = request.getParameter("Phone no");
        String email = request.getParameter("Email");

        // Prepare the SQL query
        String sql = "INSERT INTO bookings (from_location, to_location, airline, seating, departure_date, departure_time, adults, children, infants, fare_type, return_date, return_time, message, full_name, phone_number, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(sql);

        // Set the parameters
        preparedStatement.setString(1, fromLocation);
        preparedStatement.setString(2, toLocation);
        preparedStatement.setString(3, airline);
        preparedStatement.setString(4, seating);
        preparedStatement.setString(5, departureDate);
        preparedStatement.setString(6, departureTime);
        preparedStatement.setString(7, adults);
        preparedStatement.setString(8, children);
        preparedStatement.setString(9, infants);
        preparedStatement.setString(10, fareType);
        preparedStatement.setString(11, returnDate);
        preparedStatement.setString(12, returnTime);
        preparedStatement.setString(13, message);
        preparedStatement.setString(14, fullName);
        preparedStatement.setString(15, phoneNumber);
        preparedStatement.setString(16, email);

        // Execute the query
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            out.println("Booking successful!");
        } else {
            out.println("Booking failed.");
        }

    } catch (ClassNotFoundException e) {
        out.println("Database driver not found: " + e.getMessage());
    } catch (SQLException e) {
        out.println("Database error: " + e.getMessage());
    } finally {
        // Close resources in reverse order of creation
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>