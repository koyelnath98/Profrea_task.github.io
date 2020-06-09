<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Restaurants</title>

        <link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
        <link rel="stylesheet" type="text/css" href="resources/css/style.css">
        <link rel="stylesheet" type="text/css" href="resources/css/queries.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/animate.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/ionicons.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet" type="text/css">
        <link rel="apple-touch-icon" sizes="180x180" href="resources/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="resources/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="resources/favicons/favicon-16x16.png">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
    <!-- <link rel="stylesheet" type="text/css" href="des.css"> -->
    <link rel="stylesheet" type="text/css" href="vendors/css/restaurant.css">
    <style>
  
  
      .content
      {
        background-color: #DAA520;

      }

      .row,.row > .column {
        padding: 7px;

      }

      .column{
      float: left;
        width: 33.33%;
      }
      .row:after {
        content: "";
        display: table;
        clear: both;
      }
      .content {
        position: relative;
        background-color:#DAA520;
        padding: 7px;
      }

      .text-block {
        position: absolute;
        top: 5px;
        left: 5px;
        background-color: green;
        color: white;
        opacity: 0.5;
      }

      div.content {
        cursor:pointer;
      }

    </style>
    <script type="text/javascript" src="loginmanager.js"></script>
    <script type="text/javascript">
      function init()
      {

        if (typeof(Storage) !== "undefined")
        {
              if(localStorage["login"]==="true")
              {
                  document.getElementById("logoutbtn").removeAttribute("hidden");

              }
              
        }
        else
        {
            alert("Unsupported Browser");
            alert("Logging out and Redirecting");
            location.href="http://localhost:8080/GRABHUB/index.html";
        }
      }
    </script>
  </head>


  <body onload="init()">
 
  		
   <header>
   	<br>
   	<p align="center"><font face="Lato" size="10" color="white"><b>Trending This Week</font></b></font>
   	<div class="rightn" id="logoutbtn" hidden>
   		<button class="btn1" onclick="logout()"><font face="Lato" color="red" size="5">Take Me Back &nbsp</font><img src="resources/images/female.png"></button>
   	</div>
   	
   </p>
   	<P align="center"><font face="Lato" size="5" color="white"><b>Most popular restaurants in Town</b></font></P>

   </header>
        

        

        <br>
        <br>        
<h2>OUR RESTAURENTS</h2>

    <div class="main">

  <div class="row">
    <%
            try
            { 
                String val1=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM restaurant";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<div class=\"column\" onclick=\"window.location.href = 'http://localhost:8080/GRABHUB/restaurantMenu.jsp?rname="+rs.getString(2)+"\';\"><div class=\"content\"><img src=\"resources/images/"+rs.getString(7)+"\" width=\"100%\" height=\"250\"><div class=\"text-block\"><h3>"+rs.getString(8)+"</h3><p>"+rs.getString(9)+" ratings</p></div><h4>"+rs.getString(2)+"</h4><p>"+rs.getString(6)+"</p></div></div>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
    </div>
  </div>

  <br>
  <br>
        <footer>
            <div class="row">
                <div class="col span-1-of-2">
                    <ul class="footer-nav">
                        <li><a href="#">About us</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">iOS App</a></li>
                        <li><a href="#">Android App</a></li>
                    </ul>
                </div>
                <div class="col span-1-of-2">
                    <ul class="social-links">
                        <li><a href="#"><i class="ion-social-facebook"></i></a></li>
                        <li><a href="#"><i class="ion-social-twitter"></i></a></li>
                        <li><a href="#"><i class="ion-social-googleplus"></i></a></li>
                        <li><a href="#"><i class="ion-social-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
            
            <div class="row">
                <p>
                    Copyright &copy; 2020 by GrabHub. All rights reserved.
                </p>
            </div>
            
        </footer>

</body>
</html>