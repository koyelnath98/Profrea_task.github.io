<%@page import="java.sql.*"%>
        <%	  
        	  String item = request.getParameter("item");
        	  String rid = request.getParameter("rid");
			  String qty = request.getParameter("qty");
			  String oid = request.getParameter("oid");
			  String email = request.getParameter("email");
			  try
			  {

				
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				String strQuery = "SELECT UID FROM users where email=\'"+email+"\'";
				out.println(strQuery);
					ResultSet rs = stmt.executeQuery(strQuery);
					int uid=0;
					while(rs.next())
						uid = Integer.parseInt(rs.getString(1));
				String insert = "INSERT INTO orders VALUES("+oid+","+uid+","+rid+","+item+","+qty+")";
				stmt.executeUpdate(insert);
				response.setStatus(200);
				//response.sendRedirect(redirectURL);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e) {out.println(e);}
        %>