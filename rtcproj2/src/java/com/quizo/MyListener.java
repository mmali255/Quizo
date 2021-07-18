
package com.quizo;
//import javax.servlet.*;
import jakarta.servlet.*;

import java.sql.*;

public class MyListener implements ServletContextListener{

	public void contextInitialized(ServletContextEvent arg0) {
		
		Connection con=null;
	try{
		ResultSet rs;
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		
		
		con=DriverManager.getConnection("jdbc:derby://localhost:1527/sample","app", "app");

		PreparedStatement ps=con.prepareStatement("CREATE TABLE QUIZCONTACT (NAME VARCHAR(4000),EMAIL VARCHAR(4000),PHONE VARCHAR(4000),MESSAGE VARCHAR(4000))");
		ps.executeUpdate();
		PreparedStatement ps4=con.prepareStatement("CREATE TABLE QUIZINFO (SUBJECT VARCHAR(4000),QUIZNAME INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),PRIMARY KEY(QUIZNAME))");
		ps4.executeUpdate();		
		
	
		PreparedStatement  ps5=con.prepareStatement("CREATE TABLE  QUIZQ(NAME VARCHAR(4000),EMAIL VARCHAR(4000),PHONE VARCHAR(4000),QUESTION VARCHAR(4000))");
		ps5.executeUpdate();
		
		
		ps5= con.prepareStatement("CREATE TABLE  QUIZQUES(QUESTION VARCHAR(4000),OPTION1 VARCHAR(4000),OPTION2 VARCHAR(4000),OPTION3 VARCHAR(4000),OPTION4 VARCHAR(4000),ANSWER VARCHAR(4000),QUIZNAME VARCHAR(4000),QID INTEGER  GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),DESCRIPTION VARCHAR(4000))");
		ps5.executeUpdate();
		
		
		ps5= con.prepareStatement("CREATE TABLE  QUIZREGISTER (USERNAME VARCHAR(4000),USERPASS VARCHAR(4000),CATEGORY VARCHAR(4000),EMAIL VARCHAR(4000))");
		ps5.executeUpdate();
		Statement stmt=con.createStatement();
		
		}	
	
		
	    catch(Exception e){
	    	e.printStackTrace();
	    	
	    }
	    }
	    
	    public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project undeployed");
        
	}
}
