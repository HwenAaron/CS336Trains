<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link href="./zCss/registerLogic.css" rel="stylesheet" type="text/css">
</head>
<body>
	
	<div id = "alertSquare">
		<div id = "alertText">
			<%
		    try{
		    	ApplicationDB db = new ApplicationDB();
				Connection conn = db.getConnection();
		      	PreparedStatement ps = conn.prepareStatement("INSERT INTO Train_Schedule(line_name, train_id, starting_time, travel_time, schedule_date) VALUES (?,?,?,?,?)");
				ps.setString(1, request.getParameter("line"));
				ps.setString(2, request.getParameter("train"));
				ps.setString(3, request.getParameter("startTime"));
				ps.setString(4, request.getParameter("travelTime"));
				ps.setString(5, request.getParameter("traveldate"));
				int result = ps.executeUpdate();
				out.print("<div id=\"alert\">Registration successful!</div>");
				String s = "<form method=\"get\" action=\"./loginPage.jsp\"><button type=\"submit\" id=\"button\">Log In</button></form>";
				out.println(s);
		    
			%>
			<div>
				<img src="./ACtrain.gif" id = "gif">
			</div>	
			<% 	
				//close connection
				conn.close();
			} catch(Exception e){
				out.print(e);
			}
			%>
		</div>
	</div>
	
</body>
</html>
