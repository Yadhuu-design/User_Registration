<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="org.mindrot.jbcrypt.BCrypt"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");

Connection con=null;
PreparedStatement stmt=null;
ResultSet rs=null;
boolean isValidUser=false;
try{
	Class.forName("com.mysql.jdbc.Driver");
	 con=DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_168","javadb_168","Sp3cJa5A2k24");
if (email.equals("admin@gmail.com") && password.equals("Admin12@")) {
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("user", email);
			response.sendRedirect("adminwelcome.jsp");
		} else {
			String sql = "select password from festalive_user WHERE email=?";
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next()) {
				String storedHashedpassword = rs.getString("password");
				if (BCrypt.checkpw(password, storedHashedpassword)) {
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("user", email);
					response.sendRedirect("userwelcome.jsp");
				} else {
					response.sendRedirect("login.jsp?error=1");
				}
			} else {
				%>
				<script type="text/javascript">
					alert("No account? Create one");
					window.location.href = "register.jsp";
				</script>
				<%
			}
		}

	} catch (Exception e) {
		out.print("error");
	} finally {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (Exception e) {
			out.print("error");
		}
	}
%>