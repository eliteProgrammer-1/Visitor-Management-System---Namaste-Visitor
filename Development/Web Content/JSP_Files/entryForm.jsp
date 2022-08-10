<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>


<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%> <%-- Tells browser to not store this page on cache --%>
<%response.setHeader("Pragma", "no-cache");%> <%-- Tells browser to not store this page on cache, for older versions of http --%>

<%if(session.getAttribute("loggedIn") == null)
	{
		response.sendRedirect(request.getContextPath() + "/HTML/loginPage.html");
	}
%> 

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Entry Form</title>
        <link rel="stylesheet" href="../CSS/navBar.css">
        <link rel="stylesheet" href="../CSS/entryForm.css">
    </head>

    <body>
        <header>
            <nav id="navBar">
                <div id="navDiv">
                    <img src="../Images/logo.png" alt="" height="65%">
                    <span id="logo">In Time Tec</span>
                    <ul>
                        <li><a href="/Development/JSP_Files/security.jsp">Options</a></li>
                        <li><a href="/Development/Logout">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>

        <div class="container">
            <div id="center-div">
                <form action="/Development/JSP_Files/mobOTPForm.jsp" method="post">
                    <div id="form-inside">
                        <div id="left-div">
                            <input type="text" placeholder="First Name" name="firstName" class="inp">
                            <input type="text" placeholder="Mobile Number" name="mobNum" class="inp">
                        </div>

                        <div id="right-div">
                            <input type="text" placeholder="Last Name" name="lastName" class="inp">
                            <input type="text" placeholder="Aadhar Card Number" name="AadharNum" class="inp">
                        </div>
                    </div>
                    <div id="bottom-div">
                        <input type="text" placeholder="Purpose" name="purpose" class="inp center-inp">
                    </div>
                    <button type="submit" class="btn">Create Entry</button>
                </form>
            </div>
        </div>
    </body>
    </html>