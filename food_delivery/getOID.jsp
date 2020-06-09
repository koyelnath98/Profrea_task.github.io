<%@page import="java.sql.*"%>
        <%	  
			  try
			  {	
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				int oid,cid=-1;
				do
				{
					oid=(int)(Math.random()*10000);
					String strQuery = "SELECT COUNT(*) FROM orders where oid="+oid;
					ResultSet rs = stmt.executeQuery(strQuery);
					while(rs.next())
						cid = Integer.parseInt(rs.getString(1));
				}while(cid!=0);

				out.write(new Integer(oid).toString());
				response.setStatus(200);
				stmt.close();
				conn.close();
				  
			  
			  }catch(Exception e){out.println(e);}
        %>