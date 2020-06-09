<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src= "https://code.jquery.com/jquery-3.4.0.min.js"> </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="vendors/js/jquery.waypoints.min.js"></script>
    <meta charset="utf-8">
    <title>AdminPanel</title>
    <script type="text/javascript">
    	function fun()
		{
			document.getElementById("boxo").style.display = "none";
			if (typeof(Storage) !== "undefined")
		        {
		              if(localStorage["login"]==="true")
		                  document.getElementById("logoutbutton").removeAttribute("hidden");
		        }
		        else
		        {
		            alert("Unsupported Browser");
		            alert("Logging out and Redirecting");
		            location.href="http://localhost:8080/GRABHUB/index.html";
		        }
		}
    	function logout()
		{
			document.getElementById("logoutbutton").setAttribute("hidden","");
		    localStorage["login"]=false;
		    location.href="http://localhost:8080/GRABHUB/index.html";   
		}
    function chkLoginStatus()
    {
      if(localStorage["login"]==='false' || localStorage["login"]===undefined)
      {
         alert('Please Login :( ');
         return true;
      }
      return false;
    }
    	function rSubmit()
            {
                if(chkLoginStatus())  
                  return;
                // Returns successful data submission message when the entered information is stored in database.
                var dataString = 'rY='+ $("#rY").val()  + '&rX='+ $("#rX").val()  + '&rcount='+ $("#rcount").val() + '&rrate='+ $("#rrate").val()+"&rimg="+$("#rimg").val()+"&rtype="+$("#rtype").val()+"&rAddress="+$("#rAddress").val()+"&rcontact="+$("#rcontact").val()+"&rEmail="+$("#rEmail").val()+"&rID="+$("#rID").val()+"&rname="+$("#rname").val()+"&formId=1";
                	//alert(dataString);
                // AJAX Code To Submit Form.
                    $.ajax({
                    type: "POST",
                    url: "insertFormData.jsp",
                    data: dataString,
                    cache: false,
                    async:false,
                    error:function(result,status){alert(status+":"+result);},
                    success: function(result,status)
                    {
                        alert("Restaurant Added Successfully");
                    }
                    });
                    //alert('asd');
            }
            function mSubmit()
            {
                          
                 if(chkLoginStatus())  
                  return;
                // Returns successful data submission message when the entered information is stored in database.
                var dataString = 'resID='+ $("#resID").val()  + '&iname='+ $("#iname").val()  + '&iid='+ $("#iid").val() + '&iprice='+ $("#iprice").val()+"&nveg="+$("#nveg").val()+"&iimg="+$("#iimg").val()+"&idesc="+$("#idesc").val()+"&formId=3";
                	//alert(dataString);
                // AJAX Code To Submit Form.
                    $.ajax({
                    type: "POST",
                    url: "insertFormData.jsp",
                    data: dataString,
                    cache: false,
                    async:false,
                    error:function(result,status){alert(status+":"+result);},
                    success: function(result,status)
                    {
                        alert("Restaurant Added Successfully");
                    }
                    });
                    //alert('asd');
            }
            function eSubmit()
            {
                     
                if(chkLoginStatus())  
                  return;
                // Returns successful data submission message when the entered information is stored in database.
                var dataString = 'eID='+ $("#eID").val()  + '&pass='+ $("#pass").val()  + '&ph='+ $("#ph").val() + '&etype='+ $("#etype").val()+"&Address="+$("#Address").val()+"&Email="+$("#Email").val()+"&nm="+$("#nm").val()+"&formId=2";
                	//alert(dataString);
                // AJAX Code To Submit Form.
                    $.ajax({
                    type: "POST",
                    url: "insertFormData.jsp",
                    data: dataString,
                    cache: false,
                    async:false,
                    error:function(result,status){alert("Please Enter Data in Correct Format");},
                    success: function(result,status)
                    {
                        alert("Employee Added Successfully");
                    }
                    });
                    //alert('asd');
            }
    
    </script>

    <meta name="viewport" content="width=device-width, initial-scale=1">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> 
      
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script> 
      
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"> 
    </script> 
      <script src="admin.js"/> 
    
    <script src= "https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"> 
    </script>
        <link rel="stylesheet" type="text/css" href="vendors/css/admin.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
        
        <link rel="stylesheet" type="text/css" href="resources/css/queries.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/animate.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/ionicons.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet" type="text/css">
        <link rel="apple-touch-icon" sizes="180x180" href="resources/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="resources/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="resources/favicons/favicon-16x16.png">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
        <!-- Add icon library -->
        <!-- <!link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->

     
      <script type="text/javascript" src="admin.js"></script>
   
 </head>
  <body onLoad="fun()">
    
     
    <div id= "boox">
      
           <div class="leftn">
            <img src="resources/images/logo2.png" align="center"><b><font color="white" size="5px">&nbsp GRAB  HUB</b></font>
           </div>
         
         <div class="midl">
         	<font color="white" size="6px">
            <b>ADMINISTRATIVE &nbsp &nbsp PANEL</b>
        </font>
           </div>
        <div class="logoutbtn" id="logoutbutton" onclick="logout()" hidden>
            <button class="btn2" onclick="logout()" ><font face="Lato" color="red" size="5">Log Out &nbsp</font></button>
            <div class="rightn">
            	<img src="resources/images/male.png" align="right">
            </div>
          </div>
           
    </div>
         
        <br>
        <br>        

  <div class ="boxed" align="center">


    <div id="outer">
  <div class="inner"><button id="res" type="submit" class="button" onClick="fun1()" >Restaurant</button></div>
  <div class="inner"><button type="submit" class="button" onClick="fun2()">Menu</button></div>
  <div class="inner"><button class="button" onClick="fun3()">Employee</button></div>
   <div class="inner"><button class="button" onClick="fun4()">Display</button></div>
 </div>

   <div id ="boxed2">
    </div>

    <div id="boxo">
  <form id="restu">
  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="resID">Restaurant ID</label>
      <input type="text" class="form-control" id="rID" placeholder="Enter ID">
  </p>
    </div>

    <div class="form-group col-md-5" >
      <p align="left"><label for="name">Restaurant Name</label>
      <input type="text" class="form-control" id="rname" placeholder="Enter Name">
  </p>
    </div>
  </div>
  
 
  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="Email">Email ID</label>
      <input type="email" class="form-control" id="rEmail" placeholder="Enter Email ID">
  </p>
    </div>

    <div class="form-group col-md-5">
      <p align="left"><label for="contact">Contact No.</label>
      <input type="text" class="form-control" id="rcontact" placeholder="Enter Contact No.">
  </p>
    </div>
  </div>

  <div class="form-row">
  <div class="form-group col-md-10">
    <p align="left"><label for="Address">Address</label>
    <input type="text" class="form-control" id="rAddress" placeholder="Enter Address">
</p>
  </div>
</div>

  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="type">Type</label>
      <input type="text" class="form-control" id="rtype" placeholder="Enter Restaurant Type">
  </p>
    </div>

    <div class="form-group col-md-5">
      <p align="left"> <label for="img">Image</label>
      <input id="rimg" class="form-control" placeholder="URL"> 
      </p>  
    </div>
  </div>


  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="rate">Rating</label>
      <input type="text" class="form-control" id="rrate" placeholder="Enter Rating (out of 5)">
  </p>
    </div>
    <div class="form-group col-md-5">
      <p align="left"><label for="count">Rating count</label>
      <input id="rcount" class="form-control" placeholder="ex: 120">  
      </p> 
    </div>
  </div>

   
   <div class="form-row">
    <label><b>Location :</b></label>
    <div class="form-group col-auto">
      <p align="left"><label for="x">X-Coord</label></div>
      <div class="form-group col-md-3">
      <input  class="form-control" id="rX" placeholder="X-axis">
    </div>
</p>
    <div class="form-group col-auto">
      <p align="left"><label for="y">Y-Coord</label>
  </div>
     <div class="form-group col-md-3">
      <input class="form-control" placeholder="Y-axis" id="rY">   
    </div>
</p>
  </div>

  
  <button  class="btn btn-primary" id="rSave" onclick="rSubmit()">SAVE</button>
</form>




<form id="menu">
  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="resID">Restaurant ID</label>
      <input type="text" class="form-control" id="resID" placeholder="Enter ID">
  </p>
    </div>

    <div class="form-group col-md-5" >
      <p align="left"><label for="item">Item ID</label>
      	<input type="text" class="form-control" id="iid" placeholder="Enter Item ID">
  	  </p>
    </div>
  </div>
  
 
  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="name">Item Name</label>
      <input type="text" class="form-control" id="iname" placeholder="Enter Item Name">
  </p>
    </div>

    <div class="form-group col-md-5">
      <p align="left"><label for="price">Price</label>
      <input type="text" class="form-control" id="iprice" placeholder="Enter Item price">
      <p align="left">
    </div>
  </div>

  <div class="form-row">
  <div class="form-group col-md-10">
    <p align="left"><label for="desc">Description</label>
    <input type="text" class="form-control" id="idesc" placeholder="Enter Description">
</p>
  </div>
</div>

  <div class="form-row">
   
    <div class="form-group col-md-5">
      <p align="left"><label for="img">Image</label>
      <input id="iimg" class="form-control" placeholder="URL">  
      </p> 
    </div>
  </div>
  
    <div class="form-row">
   
    <div class="form-group col-md-5">
      <p align="left"><label for="img">NVeg</label>
      <input id="nveg" class="form-control" placeholder="0 or 1">  
      </p> 
    </div>
  </div>

  <br><br><br>
  <button type="submit" class="btn btn-primary" onclick="mSubmit()">SAVE</button>
</form>

   <form id="employee">
  <div class="form-row">
    <div class="form-group col-md-5">
      <p align="left"><label for="ID">Employee ID</label>
      <input type="text" class="form-control" id="eID" placeholder="Enter ID">
  </p>
    </div>

    <div class="form-group col-md-5" >
      <p align="left"><label for="nm">Name</label>
      <input type="text" class="form-control" id="nm" placeholder="Enter Employee Name">
  </p>
    </div>
  </div>
  
      <div class="form-row">
      <div class="form-group col-md-5">
      <p align="left"><label for="Email">Email ID</label>
      <input type="email" class="form-control" id="Email" placeholder="Enter Email ID">
  </p>
    </div>


    <div class="form-group col-md-5">
      <p align="left"><label for="pass">Password</label>
      <input type="password" class="form-control" id="pass" placeholder="Enter Password">
  </p>
    </div>
  </div>

  <div class="form-row">
  <div class="form-group col-md-10">
    <label for="Address">Address</label>
    <input type="text" class="form-control" id="Address" placeholder="Enter Address">
  </div>
</div>


  <div class="form-row">
   
    <div class="form-group col-md-5">
      <p align="left"><label for="ph">Phone No.</label>
      <input id="ph" class="form-control" placeholder="Enter Phone No.">
      </p>   
    </div>

     <div class="form-group col-md-5">
      <p align="left"><label for="type">Type</label>
      <input type="text" class="form-control" id="etype" placeholder="Enter Employee type (A/D/M)">
  </p>
    </div>

  </div>
  
  <br><br>
  <button type="submit" class="btn btn-primary" onclick="eSubmit()">SAVE</button>
</form>

 

    <div id="display">
     <div class="container">
    <h2>Employee</h2>
  <table class="table table-bordered table-hover table-success" id="Employee">
    <thead>
      <tr>
        <th>EID </th>
        <th>NAME</th>
        <th>Email</th>
        <th>ADDRESS</th>
        <th>Phone</th>
        <th>Type</th>
      </tr>
    </thead>
    <tbody>
    	<%
      	 try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM employee ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
    </tbody>
  </table>
    

       <h2>Users</h2>
       <table class="table table-bordered table-hover table-info" id="Users">
    <thead>
      <tr>
        <th>UID </th>
        <th>NAME</th>
        <th>Email</th>
        <th>Phone</th>
      </tr>
    </thead>
    <tbody>
      
    	<%
      	 try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM users ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(5)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>	
  </tbody>
</table>


    <h2>Restaurant</h2>
     <div class="table-responsive"> 
    <table class="table table-bordered table-hover table-sm table-success" id="Restaurant">
    <thead>
      <tr>
        <th>RID </th>
        <th>Restaurant_Name</th>
        <th>Email</th>
        <th>Address</th>
        <th>Contact</th>
        <th>Type</th>
        <th>image</th>
        <th>Rating</th>
        <th>RtnCount</th>
        <th>Xcoord</th>
         <th>Ycoord</th>
      </tr>
    </thead>
    <tbody>

    	<%
      	 try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM restaurant ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
  </tbody>
</table>

 </div>
   
      <h2>Menu</h2>
       <table class="table table-bordered table-hover table-info" id="Menu">
    <thead>
      <tr>
        <th>RID</th>
        <th>IID</th>
        <th>IName</th>
        <th>IPrice</th>
        <th>Description</th>
        <th>img</th>
        <th>NVeg  </th>
      </tr>
    </thead>
    <tbody>
    	<%
      	 try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM menu ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
  </tbody>
</table>
     

      <h2>Orders</h2>
       <table class="table table-bordered table-hover table-success" id="Orders">
    <thead>
      <tr>
        <th>OID</th>
        <th>UID</th>
        <th>RID</th>
        <th>IID</th>
        <th>Qty</th>
      </tr>
    </thead>
    <tbody>
      <%
      	 try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM orders ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
  </tbody>
  </table>
  <h2>Delivery</h2>
       <table class="table table-bordered table-hover table-info" id="Feedback">
    <thead>
      <tr>
        <th>OID</th>
        <th>EID</th>
        <th>Xcoord</th>
        <th>Ycoord</th>
      </tr>
    </thead>
    <tbody>
      <%
         try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM delivery ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
  </tbody>
</table>
</table>
	<h2>Feedback</h2>
       <table class="table table-bordered table-hover table-info" id="Feedback">
    <thead>
      <tr>
        <th>Name</th>
        <th>Email</th>
        <th>How_Find</th>
        <th>Message</th>
      </tr>
    </thead>
    <tbody>
    	<%
      	 try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM feedback ";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
  </tbody>
</table>



  </div>


 </div>
  </div>
   </div>




</body>
</html>