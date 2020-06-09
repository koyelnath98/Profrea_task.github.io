<%@page import="java.sql.*"%>
        <%	  
			  try
			  {	
			  	int oid=Integer.parseInt(request.getParameter("oid"));
			  	int eid=Integer.parseInt(request.getParameter("eid"));
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				String strQuery = "INSERT INTO Delivery values("+oid+","+eid+","+Double.parseDouble(request.getParameter("Xcoord"))+","+Double.parseDouble(request.getParameter("Ycoord"))+")";
				stmt.executeUpdate(strQuery);

				strQuery = "Update Employee SET Busy=1 WHERE EID="+eid;
				stmt.executeUpdate(strQuery);

				strQuery = "SELECT name FROM employee where eid="+eid;
				ResultSet rs = stmt.executeQuery(strQuery);
				if(rs.next())
					out.write(rs.getString(1));

				out.write("(Phone:");

				strQuery = "SELECT Phone FROM employee where eid="+eid;
				ResultSet rs1 = stmt.executeQuery(strQuery);
				if(rs1.next())
					out.write(rs1.getString(1));

				out.write(")");
				
				response.setStatus(200);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e){out.println(e);}
        %>
