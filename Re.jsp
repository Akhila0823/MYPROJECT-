<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("uname");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "akkitravels";
String userid = "Akki";
String password = "akkichan31";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head><style>
*{
text-align:center;
}
th,td{
font-size:32px;
}

</style></head>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1" align="center" width="60%">
<tr>
<th>Fname</th>
<th>lname</th>
<th>gender</th>
<th>cnum</th>
<th>address</th>
<th>email</th>
<th>password</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from clients";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("cadd") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("email")%></td>
<td><%=resultSet.getString("password")%></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
out.println("Something went wrong");
}
%>
</table> 

</body>
</html>
