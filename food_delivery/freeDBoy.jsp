<%@page import="java.sql.*"%>
        <%	  
			  try
			  {	
			  	int eid=Integer.parseInt(request.getParameter("eid"));
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				
				String strQuery = "Update Employee SET Busy=0 WHERE EID="+eid;
				stmt.executeUpdate(strQuery);

				response.setStatus(200);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e){out.println(e);}
        %>