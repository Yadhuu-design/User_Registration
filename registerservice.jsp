<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.mindrot.jbcrypt.*" %>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
Connection con = null;
PreparedStatement stmt = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_168", "javadb_168", "Sp3cJa5A2k24");

    // Check if the email is admin email
    if (email.equals("admin@gmail.com")) {
%>
        <script type="text/javascript">
            alert("Admin cannot register.");
            window.location.href = "register.jsp";
        </script>
<%
    } else {
        // Check if the email already exists
        PreparedStatement checkStmt = con.prepareStatement("SELECT COUNT(*) FROM festalive_user WHERE email = ?");
        checkStmt.setString(1, email);
        ResultSet rs = checkStmt.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        if (count > 0) {
            // User with this email already exists
%>
            <script type="text/javascript">
                alert("Email already exists. Please login.");
                window.location.href = "login.jsp";
            </script>
<%
        } else {
            // Insert the new user
            String sql = "INSERT INTO festalive_user(email, password) VALUES (?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, hashedPassword);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
%>
                <script type="text/javascript">
                    alert("Registration successful. Please login.");
                    window.location.href = "login.jsp";
                </script>
<%
            } else {
%>
                <script type="text/javascript">
                    alert("Registration failed. Please try again later.");
                    window.location.href = "register.jsp";
                </script>
<%
            }
        }
    }
} catch (Exception e) {
    e.printStackTrace();
%>
    <script type="text/javascript">
        alert("An error occurred. Please try again later.");
        window.location.href = "register.jsp";
    </script>
<%
} finally {
    try {
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
