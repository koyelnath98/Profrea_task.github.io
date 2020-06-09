<%@page import="java.sql.*"%>
        <%	  
			  try
			  {	
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");
				String val1=request.getParameter("rname");
				Statement stmt = conn.createStatement();
				String strQuery = "SELECT rid FROM restaurant where Restaurant_Name=\'"+val1+"\'";
				ResultSet rs = stmt.executeQuery(strQuery);
				int rid=-1;
				while(rs.next())
					rid = Integer.parseInt(rs.getString(1));
				//out.println(oid);
				out.write(new Integer(rid).toString());
				response.setStatus(200);
				//response.sendRedirect(redirectURL);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e){out.println(e);}
        %>