<%@page import="java.sql.*"%>
<html>
  <head>
    <title ><%out.print(request.getParameter("rname"));%> Menu</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/normalize.css">
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
       <script src="https://api.tiles.mapbox.com/mapbox-gl-js/v1.3.1/mapbox-gl.js"></script>
        <link href="https://api.tiles.mapbox.com/mapbox-gl-js/v1.3.1/mapbox-gl.css" rel="stylesheet" />
        <style>
            body { margin:0; padding:0; }
            #restaurantmap {  position:relative;  width:100%; height:80%;}
        </style>
        <link rel="stylesheet" type="text/css" href="vendors/css/animate.css">
        <link rel="stylesheet" type="text/css" href="vendors/css/ionicons.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet" type="text/css">
        <link rel="apple-touch-icon" sizes="180x180" href="resources/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="resources/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="resources/favicons/favicon-16x16.png">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">    
       
        <link rel="stylesheet" type="text/css" href="vendors/css/menu.css">
        <!-- Add icon library -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="stylesheet" type="text/css" href="vendors/css/cart.css">
      <script type="text/javascript" src="cart.js"></script>
        <script type="text/javascript">
        function fun1()
        { 
          var x = document.getElementById("myCheck").checked; 
          if(x===true)
          {
            var y = document.querySelectorAll('.boxed');    
            for (var i = 0; i < y.length; i++) 
            {
              y[i].style.display = "none";
            }

          }
          else
          {
            var y = document.querySelectorAll(".boxed");
            for (var i = 0; i < y.length; i++) 
            {
              y[i].style.display = "block";
            }
          }
        }
        function razorpay()
        {
              
              var rid=parseInt(document.getElementById('rid').innerText);
                if(localStorage["login"]==='false' || localStorage["login"]===undefined)
                {
                    alert('Please Login :( ');
                    return;   
                }
                if(document.getElementById('cartprice').innerText==='0')
                {
                    alert('Please Order Someting :( ');
                    return;
                }
                var options = {
                    "key": "rzp_test_dWOtRF4vFHYlO5", // Enter the Key ID generated from the Dashboard
                    "amount": document.getElementById('cartprice').innerText+'00', // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                    "currency": "INR",
                    "name": "GRABHUB",
                    "description": "Yaay! Thanks for Ordering :)",
                    "prefill" :{"email" : "a@m.c","contact" : "9876543210"},
                    "handler": function (response)
                    {
                          var rid=parseInt(document.getElementById('rid').innerText);
                if(localStorage["login"]==='false' || localStorage["login"]===undefined)
                {
                    alert('Please Login :( ');
                    return;   
                }
                if(document.getElementById('cartprice').innerText==='0')
                {
                    alert('Please Order Someting :( ');
                    return;
                }
                var oid=0,dboy=0;
                          $.ajax({
                                    type: "POST",
                                    url: "getOID.jsp",
                                    cache: false,
                                    async:false,
                                    success: function(result)
                                    {
                                      $("#oid").html(result);
                                    }
                                    });
                        oid=parseInt(document.getElementById('oid').innerText);
                        $.ajax({
                                    type: "POST",
                                    url: "getDBoy.jsp",
                                    cache: false,
                                    data:"oid="+oid,
                                    async:false,
                                    success: function(result)
                                    {
                                      $("#dboy").html(result);
                                    }
                                    });
                        dboy=parseInt(document.getElementById('dboy').innerText);
                        if(dboy==-1)
                        {
                          alert('All delivery partners are busy :(');
                          return;
                        }
                        var cartItems = document.getElementsByClassName('cart-items')[0];
                        while (cartItems.hasChildNodes())
                        {
                                var item = document.getElementsByClassName('cart-row')[1].getAttribute('iid');
                                var qty = document.getElementById('itmqty').value;
                                
                                // Returns successful data submission message when the entered information is stored in database.
                                var dataString = 'item='+ item  + '&qty='+ qty+"&oid="+oid+"&rid="+rid+"&email="+localStorage['email'];
                                //alert(dataString);
                                $.ajax({
                                    type: "POST",
                                    url: "addOrder.jsp",
                                    data: dataString,
                                    cache: false,
                                    error: function(xhr){alert("An error occured: " + xhr.status + " " + xhr.statusText);},
                                    success: function(result)
                                    {
                                        //alert('added');
                                    }
                                    });
                                cartItems.removeChild(cartItems.firstChild);
                        }
                        alert('Order Added Successfully :)');
                        $.ajax({
                                    type: "POST",
                                    url: "fixDBoy.jsp",
                                    cache: false,
                                    data:"oid="+oid+"&eid="+dboy,
                                    async:false,
                                    success: function(result)
                                    {
                                      alert(result+' will be deliverying your food shortly :)');
                                    }
                                    });
                        $.ajax({
                                    type: "POST",
                                    url: "freeDBoy.jsp",
                                    cache: false,
                                    data:"eid="+dboy,
                                    async:false,
                                    success: function(result)
                                    {
                                      //$("#dboy").html(result);
                                    }
                                    });
                        setTimeout(function(){alert('Order Delivered Successfully :)')},6999);
                        document.getElementById('oid').innerText='';
                        updateCartTotal();
                    },
                    "theme": {
                        "color": "#008000"
                    }
                };
                var rzp1 = new Razorpay(options);
                rzp1.open();
        }
        function cod()
        {
                var rid=parseInt(document.getElementById('rid').innerText);
                if(localStorage["login"]==='false' || localStorage["login"]===undefined)
                {
                    alert('Please Login :( ');
                    return;   
                }
                if(document.getElementById('cartprice').innerText==='0')
                {
                    alert('Please Order Someting :( ');
                    return;
                }
                var oid=0,dboy=0;
                          $.ajax({
                                    type: "POST",
                                    url: "getOID.jsp",
                                    cache: false,
                                    async:false,
                                    success: function(result)
                                    {
                                      $("#oid").html(result);
                                    }
                                    });
                        oid=parseInt(document.getElementById('oid').innerText);
                        $.ajax({
                                    type: "POST",
                                    url: "getDBoy.jsp",
                                    cache: false,
                                    data:"oid="+oid,
                                    async:false,
                                    success: function(result)
                                    {
                                      $("#dboy").html(result);
                                    }
                                    });
                        dboy=parseInt(document.getElementById('dboy').innerText);
                        if(dboy==-1)
                        {
                          alert('All delivery partners are busy :(');
                          return;
                        }
                        var cartItems = document.getElementsByClassName('cart-items')[0];
                        while (cartItems.hasChildNodes())
                        {
                                var item = document.getElementsByClassName('cart-row')[1].getAttribute('iid');
                                var qty = document.getElementById('itmqty').value;
                                
                                // Returns successful data submission message when the entered information is stored in database.
                                var dataString = 'item='+ item  + '&qty='+ qty+"&oid="+oid+"&rid="+rid+"&email="+localStorage['email'];
                                //alert(dataString);
                                $.ajax({
                                    type: "POST",
                                    url: "addOrder.jsp",
                                    data: dataString,
                                    cache: false,
                                    error: function(xhr){alert("An error occured: " + xhr.status + " " + xhr.statusText);},
                                    success: function(result)
                                    {
                                        //alert('added');
                                    }
                                    });
                                cartItems.removeChild(cartItems.firstChild);
                        }
                        alert('Order Added Successfully :)');
                        $.ajax({
                                    type: "POST",
                                    url: "fixDBoy.jsp",
                                    cache: false,
                                    data:"oid="+oid+"&eid="+dboy+"&Xcoord="+document.getElementById('dX').innerText+"&Ycoord="+document.getElementById('dY').innerText,
                                    async:false,
                                    success: function(result)
                                    {
                                      alert(result+' will be deliverying your food shortly :)');
                                    }
                                    });
                        $.ajax({
                                    type: "POST",
                                    url: "freeDBoy.jsp",
                                    cache: false,
                                    data:"eid="+dboy,
                                    async:false,
                                    success: function(result)
                                    {
                                      //$("#dboy").html(result);
                                    }
                                    });
                        setTimeout(function(){alert('Order Delivered Successfully :)')},6999);
                        document.getElementById('oid').innerText='';
                        updateCartTotal();
            }
            //document.getElementsByClassName('btn-purchase')[0].addEventListener('click', razorpay);
      </script>
      <script type="text/javascript" src="loginmanager.js"></script>
  </head>
<body onload="restaurantInit()" > 
   
    <nav>
        <div class="leftn">
            <img src="resources/images/logo2.png" align="left"><b> &nbsp GRAB  HUB</b>
           </div>
           <div class="leftn1" id="logoutbtn" hidden>
            <button class="btn2" onclick="logout()"><font face="Lato" color="red" size="5">Take Me Back &nbsp</font></button>
            <img src="resources/images/female.png" align="right" >
          </div>
           <div class="leftn2">
            <a href="#" id="uma" onclick="openNav()">
            <font size="5" color="green"><b>Cart </b>
            </font><i class="fa fa-shopping-cart" style="font-size:25px;color:blue"></i></a>
          </div>
         
         
    </nav>
 
    <div class="boxed1">

        <p><b><font size="5" color="white">order food online from</font></b></p>
        <%
            try
            { 
                String val11=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                String strQuery = "SELECT * FROM restaurant WHERE Restaurant_Name=\'"+val11+"\'";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<p id=\"rid\" hidden>"+rs.getString(1)+"</p><p id=\"Xcoord\" hidden>"+rs.getString(10)+"</p><p id=\"Ycoord\" hidden>"+rs.getString(11)+"</p><div class=\"text-block\"><b>"+rs.getString(8)+"</b></div><b><font size=\"6\" color=\"white\">"+rs.getString(2)+"</font></b><br></div><p style=\"text-align: left;\"><font color=\"blue\" face=\"Lato\"><br> <b><font color=\"green\">Contact:</font>"+rs.getString(5)+"</b></font><span style=\"float: right;\"><font color=\"blue\" face=\"Lato\"><b><font color=\"green\">E-mail:</font>"+rs.getString(3)+"</b></font></span>");
                }
                response.setStatus(200);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
        
      </p>
      <br>
      <div id="restaurantmap"></div>
      <div id="instructions"></div>
    <script>
      var start = [parseFloat(document.getElementById('Xcoord').innerText),parseFloat(document.getElementById('Ycoord').innerText)];
      mapboxgl.accessToken = 'pk.eyJ1IjoicHNpbDEyMzQiLCJhIjoiY2s4NDc2dHB3MWtrZDNkbG55dGp0eG5lYyJ9.1C8jNh8nsPdZ5BstTY9sjA';
      var map = new mapboxgl.Map({
        container: 'restaurantmap', // container id
        style: 'mapbox://styles/mapbox/streets-v11', //stylesheet location
        center: start, // starting position
        zoom: 12 // starting zoom
      });


      // initialize the map canvas to interact with later
      var canvas = map.getCanvasContainer();

      // an arbitrary start will always be the same
      // only the end or destination will change
      var temp;
      // create a function to make a directions request
      function getRoute(end)
      {
        // make directions request using cycling profile
        $("#dX").html(end[0]);
        $("#dY").html(end[1]);
        var url =
          'https://api.mapbox.com/directions/v5/mapbox/driving/' +
          start[0] +
          ',' +
          start[1] +
          ';' +
          end[0] +
          ',' +
          end[1] +
          '?steps=true&geometries=geojson&access_token=' +
          mapboxgl.accessToken;
        // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
        var req = new XMLHttpRequest();
        req.open('GET', url, true);
        req.onload = function() {
          var json = JSON.parse(req.response);
          var data = json.routes[0];
          var route = data.geometry.coordinates;
          var geojson = {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': 'LineString',
              'coordinates': route
            }
          };
          // if the route already exists on the map, we'll reset it using setData
          if (map.getSource('route'))
          {
            map.getSource('route').setData(geojson);
          }
          // otherwise, we'll make a new request
          else 
          {
            map.addLayer({
              'id': 'route',
              'type': 'line',
              'source': {
                'type': 'geojson',
                'data': {
                  'type': 'Feature',
                  'properties': {},
                  'geometry': {
                    'type': 'LineString',
                    'coordinates': geojson
                  }
                }
              },
              'layout': {
                'line-join': 'round',
                'line-cap': 'round'
              },
              'paint': {
                'line-color': '#3887be',
                'line-width': 5,
                'line-opacity': 0.75
              }
            });
          }

          // get the sidebar and add the instructions
          var instructions = document.getElementById('instructions');
          
            instructions.innerHTML =
              '<br><center><span class="duration"> Time to deliver : ' +
              Math.floor(data.duration / 60) +
              ' min &#128666;  </span></center>' ;
          
        };
        req.send();
      }

      map.on('load', function()
      {
        // make an initial directions request that
        // starts and ends at the same location
        getRoute(start);

        // Add destination to the map
        map.addLayer({
          'id': 'start',
          'type': 'circle',
          'source': {
            'type': 'geojson',
            'data': {
              'type': 'FeatureCollection',
              'features': [
                {
                  'type': 'Feature',
                  'properties': {},
                  'geometry': {
                    'type': 'Point',
                    'coordinates': start
                  }
                }
              ]
            }
          },
          'paint': {
            'circle-radius': 10,
            'circle-color': '#f30'
          }
        });

        // allow the user to click the map to change the destination
        if (navigator.geolocation)
        {
          navigator.geolocation.getCurrentPosition(assignLoc);
        }
        else
        {
          x.innerHTML = "Geolocation is not supported by this browser.";
        }
        //while(temp==undefined){alert(temp==undefined);};
        
      });
      function assignLoc(position)
      {
        temp=[position.coords.longitude,position.coords.latitude];
        pointLoc(temp);
      }
      function pointLoc(e)
        {
          // var coordsObj = e.lngLat;
          canvas.style.cursor = '';
          var coords = e;
          // Object.keys(coordsObj).map(function(key) {
          //   return coordsObj[key];
          // });
          var end = {
            'type': 'FeatureCollection',
            'features': [
              {
                'type': 'Feature',
                'properties': {},
                'geometry': {
                  'type': 'Point',
                  'coordinates': coords
                }
              }
            ]
          };
          if (map.getLayer('end'))
          {
            map.getSource('end').setData(end);
          }
          else
          {
            map.addLayer({
              'id': 'end',
              'type': 'circle',
              'source': {
                'type': 'geojson',
                'data': {
                  'type': 'FeatureCollection',
                  'features': [
                    {
                      'type': 'Feature',
                      'properties': {},
                      'geometry': {
                        'type': 'Point',
                        'coordinates': coords
                      }
                    }
                  ]
                }
              },
              'paint': {
                'circle-radius': 10,
                'circle-color': '#008000'
              }
            });
          }
          getRoute(coords);
        }

    </script>
      
        <br>
        <h4>VEG only</h4>
        <label class="switch">
          <input type="checkbox" id="myCheck" onchange="fun1()">
          <span class="slider round"></span>
        </label>   
        
        <ul class="thumbs" id="menuDiv" >
          <%
            try
            { 
                String val1=request.getParameter("rname");
                Class.forName("com.mysql.jdbc.Driver");

                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/GRABHUB?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "pritam", "pritam");

                Statement stmt = conn.createStatement();
                int rid=-1;
                String strQuery = "SELECT rid FROM restaurant where Restaurant_Name=\'"+val1+"\'";
                ResultSet rs = stmt.executeQuery(strQuery);
                while(rs.next())
                    rid = Integer.parseInt(rs.getString(1));
               // out.print(Integer.toString(rid));
                strQuery = "SELECT * FROM menu where rid="+rid;
                rs = stmt.executeQuery(strQuery);
                while(rs.next())
                {
                  out.println("<div  "+((Integer.parseInt(rs.getString(7))!=0)?"class=\"boxed\" id=\"nonv\"":"class=\"boxed2\"")+"><li><a><img class=\"shop-item-image\" src=\"resources/images/"+rs.getString(6)+"\" width=\"100\" height=\"100\" ><button class=\"button\" value=\"ADD\">ADD</button><span><h5><span class=\"shop-item-title\" iid=\'"+rs.getString(2)+"\'>"+rs.getString(3)+"<i>("+rs.getString(5)+")</i></span></h5><p><b><span class=\"shop-item-price\">Rs."+rs.getString(4)+"</span></b></p></li></div>");
                }
                //out.println(oid);
                response.setStatus(200);
                //response.sendRedirect(redirectURL);
                stmt.close();
                conn.close();
              
            }catch(Exception e){out.println(e);}
          %>
        </ul>
<br><br><br><br><br> 
<footer>
            <div class="row">
                <div class="col span-1-of-2">
                    <ul class="footer-nav">
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
            <br><br><br>
            <div class="row">
                <p>
                    Copyright &copy; 2020 by Grab Hub. All rights reserved.
                </p>
            </div>
            
        </footer>
        
    
 <div id="mySidenav" class="sidenav">
      <div id="cart">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <font face="Lato">
          <br>
          <h5>Lets check</h5>
          <h5>what's in your Cart !</h5>
        </font>

  <section class="container content-section">
            <div class="cart-row">
                <span class="cart-item cart-header cart-column">ITEM</span>
                <span class="cart-price cart-header cart-column">PRICE</span>
                <span class="cart-quantity cart-header cart-column">QUANTITY</span>
            </div>
            <div class="cart-items">
            </div>
            <div class="cart-total">
              <p>
                <strong class="cart-total-title">Total : &emsp; Rs.</strong>
                <b><span class="cart-total-price" id="cartprice">0</span></b>
              </p>
            </div>
            <br>
            <div class="btn-group">
            <button class="btn btn-primary btn-purchase" id="cartbutton" type="button" onclick="razorpay()">
              <font size="3">PAY NOW</font></button>
            <button class="btn btn-primary btn-purchase" id="cartbuttoncod" type="button" onclick="cod()">
              <font size="3">CASH ON DELIVERY</font></button>
            </div>
          </center>
                <p id="oid" hidden></p>
                <p id="dboy" hidden></p>
                <p id="dX" hidden></p>
                <p id="dY" hidden></p>
        </section>
</div>
</body>
</html>
       