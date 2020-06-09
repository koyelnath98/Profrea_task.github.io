<%@page import="java.sql.*"%>
        <%	  
        	  String val1 = request.getParameter("pno");
			  String val2 = request.getParameter("name");
		   	  String val3 = request.getParameter("email");
		   	  String val4 = request.getParameter("pwd");
	
			  try
			  {

				
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();

				String strQuery = "SELECT MAX(UID) FROM Users";
				ResultSet rs = stmt.executeQuery(strQuery);
				int cid=0;
				while(rs.next())
					cid = Integer.parseInt(rs.getString(1));
				cid++;
				String insert = "INSERT INTO Users VALUES("+cid+",\'"+val2+"\',\'"+val3+"\',\'"+val4+"\',\'"+val1+"\')";
				out.println(insert);
				stmt.executeUpdate(insert);
				String redirectURL = "http://localhost:8080/GRABHUB/index.html";
				response.setStatus(200);
				stmt.close();
				conn.close();
			  }
			  catch(Exception e)
			  {
			  	response.setStatus(400);
			  }
        %>