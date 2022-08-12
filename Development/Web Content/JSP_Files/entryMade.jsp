<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%> <%-- Tells browser to not store this page on cache --%>
	<%response.setHeader("Pragma", "no-cache");%> <%-- Tells browser to not store this page on cache, for older versions of http --%>

	
	<%if(session.getAttribute("loggedIn") == null)
	{
		response.sendRedirect(request.getContextPath() + "/HTML/loginPage.html");
	}
	%>
	
   <%
	  if(session.getAttribute("visitorData") == null)
	  {
		  response.sendRedirect(request.getContextPath() + "/JSP_Files/entryForm.jsp");
	  }
   %>
	
	<%session.removeAttribute("visitorData"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Successfull</title>
<link rel="stylesheet" href="../CSS/navBar.css">
<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap');

    .container {
        display: flex;
        background-color: #FBAB7E;
        background-image: linear-gradient(62deg, #FBAB7E 0%, #fbc531 100%);

        display: flex;
        align-items: center;
        justify-content: center;
        background-color: cadetblue;
        width: 100vw;
        height: 92vh;
    }

    .inner-box
    {
        background-color: white;
        width: 35%;
        height: 45%;
        font-size: 1.7rem;
        font-weight: 500;
        font-family: 'Montserrat', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        border-radius: 6px;
        box-shadow: 3px 3px 15px 0px;
    }

</style>
</head>
<body>
	<jsp:include page="../HTML/logoutNavSecurity.html"/>
	<div class="container">
        <div class="inner-box">
            Entry Created Successfully!
        </div>
	</div>
</body>
</html>