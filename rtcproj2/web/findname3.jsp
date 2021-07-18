<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");
System.out.println(n+"findname3");
session.setAttribute("quizname",n);
if(n.length()>0){
out.print("<font style='color:navy'><B>Quiz"+n+" containns 10 Question<br>Each question is of 1 point</B><br></font>");
out.print("<input type='submit' value='Start Quiz' />");
session.setAttribute("subject",n);
}
//end of if
%>