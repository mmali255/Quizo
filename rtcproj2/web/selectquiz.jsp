<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>



   <%  
String subjectselec=request.getParameter("category");
if( subjectselec =="CAO")
{
%>
<jsp:forward page="CAO.jsp"></jsp:forward>
<%
    }
 else if(subjectselec=="DAA")
{
%>
<jsp:forward page="DAA.jsp"></jsp:forward>
<%
    }
else if(subjectselec=="DM")
{
%>
<jsp:forward page="DM.jsp"></jsp:forward>
<%
    }

%>  
