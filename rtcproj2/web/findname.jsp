<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("org.apache.derby.jdbc.ClientDriver");	
Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app", "app");
PreparedStatement ps=con.prepareStatement("select username from quizregister where username='"+n+"'");
ResultSet rs=ps.executeQuery();
while(rs.next()){
out.print("<font style='color:red'>Username already exist</font>");
}
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>