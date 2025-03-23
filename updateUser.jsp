<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phone = request.getParameter("phone");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Initialize database connection
        String dbUrl = "jdbc:mysql://localhost:3306/webdb2";
        String dbUser = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Update the user details in the database
        String query = "UPDATE users SET email = ?, password = ?, phone = ? WHERE username = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);
        pstmt.setString(3, phone);
        pstmt.setString(4, username);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("Data updated successfully.");
        } else {
            out.println("Error: No matching user found.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
