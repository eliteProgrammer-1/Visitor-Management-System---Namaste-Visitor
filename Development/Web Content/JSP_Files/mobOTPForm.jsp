<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="Verification.*" %>
    <%@ page import="security.*" %>
	   
    <%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");%> <%-- Tells browser to not store this page on cache --%>
	<%response.setHeader("Pragma", "no-cache");%> <%-- Tells browser to not store this page on cache, for older versions of http --%>

	
	<%if(session.getAttribute("loggedIn") == null)
	{
		response.sendRedirect(request.getContextPath() + "/HTML/loginPage.html");
	}
	%>
	
	<%	
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String aadharNum = request.getParameter("aadharNum");
		String purpose = request.getParameter("purpose");
    	String mobNum = request.getParameter("mobNum");
		String mssg = "Your OTP for Namaste Visitor - In Time Tec : ";
    %>
   
    
	<%
		//int apiStatusCode = SendOTPOnMobile.sendOTP(mobNum, mssg);
		
	%>

	<%	
		boolean hittingFirstTime = true;
		if(session.getAttribute("visitorData") == null) // first time hitting page
		{
			VisitorData data = new VisitorData(firstName, lastName, mobNum, aadharNum, purpose);
			session.setAttribute("visitorData", data);	
		}
		else // redirected because otp is incorrect
		{
			hittingFirstTime = false;
		}
    %>
    
    
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OTP</title>
<link rel="stylesheet" href="../CSS/loginPage.css">
<link rel="stylesheet" href="../CSS/navBar.css">
</head>
<body>
	<jsp:include page="../HTML/logoutNavSecurity.html"/>
	<div class="container">
		<form action="/Development/verifyOTP" method="post">
			<%
				if(hittingFirstTime == false)
				{
					out.println("<h3 style='margin-bottom: 5rem; margin-top: 1rem; color: red;' >Incorrect OTP</h3>");
				}
			%>
			<input type="text" placeholder="Enter OTP" class="inp" name="OTP">
			<button type="submit" class="btn">Enter</button>
		</form>
	</div>
</body>
</html>