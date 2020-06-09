<%@page import="java.sql.*"%>
        <%	  
        	  try
			  {

				
				Class.forName("com.mysql.jdbc.Driver");

				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

				Statement stmt = conn.createStatement();
				String insert="";
				out.println(Integer.parseInt(request.getParameter("formId")));
				switch(Integer.parseInt(request.getParameter("formId")))
				{

					case 1:insert = "INSERT INTO Restaurant VALUES("+request.getParameter("rID")+",\'"+request.getParameter("rname")+"\',\'"+request.getParameter("rEmail")+"\',\'"+request.getParameter("rAddress")+"\',\'"+request.getParameter("rcontact")+"\',\'"+request.getParameter("rtype")+"\',\'"+request.getParameter("rimg")+"\',\'"+request.getParameter("rrate")+"\',"+request.getParameter("rcount")+","+request.getParameter("rX")+","+request.getParameter("rY")+")";out.println(insert);break;

					case 2:insert = "INSERT INTO Employee VALUES("+request.getParameter("eID")+",\'"+request.getParameter("nm")+"\',\'"+request.getParameter("Email")+"\',\'"+request.getParameter("pass")+"\',\'"+request.getParameter("Address")+"\',\'"+request.getParameter("ph")+"\',\'"+request.getParameter("etype")+"\',"+((request.getParameter("etype").equals("D"))?0:1)+")";out.println(insert);break;

					     
					case 3:insert = "INSERT INTO menu VALUES("+request.getParameter("resID")+","+request.getParameter("iid")+",\'"+request.getParameter("iname")+"\',"+request.getParameter("iprice")+",\'"+request.getParameter("idesc")+"\',\'"+request.getParameter("iimg")+"\',"+request.getParameter("nveg")+")";out.println(insert);break;
				}
				stmt.executeUpdate(insert);

				response.setStatus(200);
				stmt.close();
				conn.close();
			  }
			  catch(Exception e)
			  {
			  	response.setStatus(400);
			  }
        %>