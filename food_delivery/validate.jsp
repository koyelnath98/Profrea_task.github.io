<%@page import="java.sql.*"%>
        <%	  String val1 = request.getParameter("uname");
			  String val2 = request.getParameter("psw");
		   
	
			  try {

				
				Class.forName("com.mysql.jdbc.Driver");
				//new com.mysql.jdbc.Driver();


				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/grabhub?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				String query,pwd;
				if(val1.indexOf("@grabhub.com")!=-1 || val1.indexOf("@delivery.grabhub.com")!=-1)
					query = "SELECT * FROM employee WHERE Email=\'"+val1+"\'";
				else
					query = "SELECT * FROM Users WHERE Email=\'"+val1+"\'";
				//out.println(query);
				ResultSet rs = stmt.executeQuery(query);
				int c=0;
				if(rs.next())	
				{
					//if(val1.indexOf("@grabhub.com")!=-1)
					//	pwd=rs.getString("PASSWORD");
					//else
					//	pwd=rs.getString("Password");
					//c++;
					//out.println(pwd);
					//out.println(val2);
					if(rs.getString(4).equals(val2))
					{
						  //String redirectURL = "http://localhost:8080/GRABHUB/Restaurants.html";
						  //response.sendRedirect(redirectURL);
						  out.println("true");
					}
					else
					{
						//String redirectURL = "http://localhost:8080/GRABHUB/index.html";
						
						//Thread.sleep(2000);
						//response.sendRedirect(redirectURL);
						out.println("false");
						//response.setStatus(200);
					}
				}
				else
				{
					//out.println("error");
					response.setStatus(400);
				}
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e) {out.println(e);}
        %>