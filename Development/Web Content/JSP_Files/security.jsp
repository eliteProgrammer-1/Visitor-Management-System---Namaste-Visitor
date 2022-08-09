<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<title>Security</title>
<link rel="stylesheet" href="../CSS/navBar.css">
<link rel="stylesheet" href="../CSS/security.css">
</head>
<body>
    <header>
        <nav id="navBar">
            <div id="navDiv">
                <img src="../Images/logo.png" alt="" height="65%">
                <span id="logo">In Time Tec</span>
                <ul>
                    <!-- <li><a href="#"></a></li> -->
                    <li><a href="#">Logout</a></li>
                </ul>
            </div>
        </nav>
    </header>
    
    <div class="container">
        <div id="user-name">
            <%out.println(session.getAttribute("emp_id"));%>
        </div>
            <form action="choices" method="post">
                <select name="chooseOption" id="chooseOption">
                    <option value="create">Create Entry</option>
                    <option value="view">View Entries</option>
                    <option value="invite">Invite Visitor</option>
                </select>
                <button type="submit" class="btn">Select</button>
            </form>
    </div>
    

</body>
</html>