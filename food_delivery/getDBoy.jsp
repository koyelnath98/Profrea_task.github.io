<%@page import="java.sql.*"%>
        <%	  
			  try
			  {	
			  	int oid=Integer.parseInt(request.getParameter("oid"));
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				int eid=-1;
				
				String strQuery = "SELECT * FROM employee where type='D' and Busy=0";
				ResultSet rs = stmt.executeQuery(strQuery);
				if(rs.next())
					eid = Integer.parseInt(rs.getString(1));
				
				out.write(new Integer(eid).toString());

				response.setStatus(200);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e){out.println(e);}
        %>