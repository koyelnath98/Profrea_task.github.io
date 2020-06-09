 
function logout()
{
	document.getElementById("logoutbtn").setAttribute("hidden","");
    localStorage["login"]=false;
    location.href="http://localhost:8080/GRABHUB/index.html";   
}
function restaurantInit()
{
	    if (typeof(Storage) !== "undefined")
        {
              if(localStorage["login"]==="true")
                  document.getElementById("logoutbtn").removeAttribute("hidden");
        }
        else
        {
            alert("Unsupported Browser");
            alert("Logging out and Redirecting");
            location.href="http://localhost:8080/GRABHUB/index.html";
        }
}

        