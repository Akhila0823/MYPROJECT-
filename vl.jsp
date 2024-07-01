<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "akkitravels";
String userid = "Akki";
String password = "akkichan31";
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
int flag = 0; // Declare the 'flag' variable
try {
    Class.forName(driver);
    String uid = request.getParameter("uname");
    String uname = request.getParameter("pwd");
    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
    statement = connection.createStatement();
    String sql = "select * from clients where email='" + uid + "' and password='" + uname + "'";
    resultSet = statement.executeQuery(sql);
    while (resultSet.next()) {
        flag = 1;
    }
    if (flag == 1) {
        response.sendRedirect("akki.html");
    } else {
        response.sendRedirect("login.html?msg=Invalid Credentials! Try again");
    }
} catch (Exception e) {
    out.println(e.getMessage());
} finally {
    try {
        if (resultSet != null) resultSet.close();
        if (statement != null) statement.close();
        if (connection != null) connection.close();
    } catch (Exception ex) {
        out.println(ex.getMessage());
    }
}
%>

