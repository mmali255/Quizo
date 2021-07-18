<!-- page will be displayed after submitting the quiz -->
<!--Redirected from quiz.jsp  -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" type="text/css" href="form.css">
<meta charset="ISO-8859-1">
</head>
<body style="background:#E0FFFF;">
<form action="Answer.jsp" method="POST">
<b><center><h2>Quiz</h2><br></center></b>
<%@ page import=" java.sql.Connection,
 java.sql.DriverManager,
 java.sql.PreparedStatement,
 java.sql.ResultSet,
 java.sql.SQLException,
java.sql.Statement,
 java.sql.ResultSetMetaData,
java.util.*" %>
<%!
	String url1="jdbc:mysql://localhost:3306/quiz";
	Connection conn1 = null;
	Statement stmt1 = null;
	ResultSet rs1 = null;
	String ans;
	String dbans;
	String Username="root";
	String password="Qwerty";
	int num=1;
%>
<%
	
	try {
		    String table_name=request.getParameter("subject");
		    Class.forName("org.apache.derby.jdbc.ClientDriver");
		    System.out.println("Driver registered");
		
		    //STEP 2: Establish Connection
	
                    Connection conn1=DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app", "app");

		    System.out.println("Connection established with Database1");
		    stmt1 = conn1.createStatement();
		
		    //Creating the query
		    String query1 = "SELECT * FROM "+table_name;
		    rs1=stmt1.executeQuery(query1);
                    
		    while(rs1.next())
		    {
	

				String name="d"+Integer.toString(num);
				out.println(num+")"+rs1.getString(1)+" *:");
				out.println("<br><br>");
				out.println("<input type=\"radio\" name=\""+name+"\" value=\"1\">");
                                
				out.println(rs1.getString(2)+"&emsp;");
				out.println("<input type=\"radio\" name=\""+name+"\" value=\"2\">");
				out.println(rs1.getString(3)+"&emsp;");
				out.println("<input type=\"radio\" name=\""+name+"\" value=\"3\">");
				out.println(rs1.getString(4)+"&emsp;");
				out.println("<input type=\"radio\" name=\""+name+"\" value=\"4\">");
                                out.println(rs1.getString(5)+"&emsp;");
				out.println("<br><br>");
				rs1.next();
	   			num++;
		}
                    session.setAttribute("subject",table_name);
	}
	catch (ClassNotFoundException ex)
	{
	    System.out.println(ex);
	}
	catch (SQLException ex) 
	{
	    System.out.println(ex);
	}
	finally
	{   
        	//Step 6: Close all resources
            try {
                if(rs1!= null ) {
                    rs1.close();
                   
                }
                if (stmt1!= null) {
                    stmt1.close();
                    
                }
                if (conn1!= null) {
                    conn1.close();
                   
                }
            }
            catch (SQLException ex) 
            {
                System.out.println("Exception occured while releasing resources");
            }
	}
%>

<br><br>
<center><button class="button" name="sub"><strong>SUBMIT</strong></button></center>
</form>
</body>
</html>