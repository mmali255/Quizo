<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<% try {
String subject= request.getParameter("subject");
Class.forName("org.apache.derby.jdbc.ClientDriver");	
Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app", "app");
PreparedStatement ps=con.prepareStatement("insert into quizinfo(subject) values('"+subject+"') " );
int s= ps.executeUpdate();

 }
catch(Exception e){e.printStackTrace();}
%>

<jsp:forward page="createquiz1.jsp"></jsp:forward>
