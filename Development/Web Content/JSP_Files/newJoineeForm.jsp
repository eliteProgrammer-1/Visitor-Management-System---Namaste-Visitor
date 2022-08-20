<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    if(session.getAttribute("loggedIn") == null)
    {
        response.sendRedirect(request.getContextPath() + "/HTML/loginPage.html");
    }
%>
    
 <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Invite Joinee</title>
        <link rel="stylesheet" href="../CSS/navBar.css">
        <link rel="stylesheet" href="../CSS/entryForm.css">
    </head>

    <body>
        <jsp:include page="../HTML/logoutNavSecurity.html"/>
        <div class="containerr">
        	 <div class="titleDiv">
                <h1>Joinee Invitation Form</h1>
            </div>
            <div id="center-div">
                <form action="/Development/SendEmail" method="post">
                    <div id="form-inside">
                        <div id="left-div">
                            <input type="text" placeholder="First Name" name="firstName" class="inp">
                            <input type="text" placeholder="Mobile Number" name="mobNum" class="inp">
                        </div>

                        <div id="right-div">
                            <input type="text" placeholder="Last Name" name="lastName" class="inp">
                            <input type="text" placeholder="Aadhar Card Number" name="aadharNum" class="inp">
                        </div>
                    </div>
                    <div id="bottom-div">
                        <input type="text" placeholder="Email" name="email" class="inp center-inp">
                    </div>
                    <button type="submit" class="btn">Invite Member</button>
                </form>
            </div>
        </div>
    </body>
    </html>