<%@page import="java.sql.*"%>
        <%	  
        	  String val1 = request.getParameter("name");
			  String val2 = request.getParameter("email");
		   	  String val3 = request.getParameter("find-us");
		   	  String val4 = request.getParameter("message");
	
			  try
			  {

				
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();

				String insert = "INSERT INTO Feedback VALUES("+"\'"+val1+"\',\'"+val2+"\',\'"+val3+"\',\'"+val4+"\')";
				stmt.executeUpdate(insert);
				String redirectURL = "http://localhost:8080/GRABHUB/index.html";
				//response.sendRedirect(redirectURL);
				out.println(redirectURL);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e) {out.println(e);}
        %>