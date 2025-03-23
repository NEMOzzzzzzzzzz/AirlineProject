<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Initialize database connection
        String dbUrl = "jdbc:mysql://localhost:3306/webdb2";
        String dbUser = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Delete the user from the database
        String query = "DELETE FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, username);

        int rowsAffected = pstmt.executeUpdate();
        if (rowsAffected > 0) {
            out.println("User deleted successfully.");
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
