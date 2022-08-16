<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ page import="java.sql.*" %>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    if(session.getAttribute("loggedIn") == null)
    {
        response.sendRedirect(request.getContextPath() + "/HTML/loginPage.html");
    }
%>


<%
	if(session.getAttribute("entries") == null) // when page is refreshed
	{
		response.sendRedirect(request.getContextPath() + "/showEntries_1");
	}
%>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Entries</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
            integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="../CSS/navBar.css">
        <link rel="stylesheet" href="../CSS/showData.css">
        <link rel="stylesheet" href="../CSS/showData_2.css">
        <link rel="stylesheet" href="../CSS/showData_3.css">
    </head>

    <body>
        <jsp:include page="../HTML/logoutNavSecurity.html" />

        <div id="formBox">
            <!-- <form action="" method="post" id="exitTimeForm">
                <h4 name="visitingID" style="font-family: 'Montserrat', sans-serif; margin-bottom: 2rem;">#432</h3>
                <div id="form-inside">
                    <div id="left-div">
                        <input type="text" placeholder="First Name" id="firstName" class="inpt">
                        <input type="text" placeholder="Mobile Number" id="mobNum" class="inpt">
                    </div>

                    <div id="right-div">
                        <input type="text" placeholder="Last Name" id="lastName" class="inpt">
                        <input type="text" placeholder="Aadhar Card Number" id="aadharNum" class="inpt">
                    </div>
                </div>
                <button type="submit" class="btn">Exit</button>
            </form> -->

            <form action="" method="post" id="editForm">
                <div id="form-inside">
                    <div id="left-div">
                        <input type="text" placeholder="First Name" name="firstName" class="inpt">
                        <input type="text" placeholder="AadharNum" name="aadharNum" class="inpt">
                    </div>

                    <div id="right-div">
                        <input type="text" placeholder="Last Name" name="lastName" class="inpt">
                        <input type="text" placeholder="Purpose" name="purpose" class="inpt">
                    </div>
                </div>
                <button type="submit" class="btn">Edit</button>
            </form>
        </div>

        <div class="containerr" id="container">

            <div class="upperBox">
                <div class="radio">
                    <input label="Search via other Attributes" type="radio" id="" name="searchOption"
                        value="other-options" checked>
                    <input label="Search via Date" type="radio" id="" name="searchOption" value="date-time">
                </div>

                <form action="/Development/SearchFunc" method="post" id="searchViaOtherAttributes">
                    <div id="searchViaOtherAttributesInp">
                        <select name="searchBy" class="inp">
                            <option value="visitingID">Visiting ID</option>
                            <option value="name">Name</option>
                            <option value="mobNum">Mobile Number</option>
                            <option value="aadharNum">Aadhar Card Number</option>
                        </select>
                        <input type="text" name="inpWord" class="inp" id="inpWord">
                    </div>

                    <div id="searchViaOtherAttributesBtn">
                        <button type="submit" class="btn-small">Search</button>
                    </div>
                </form>

                <form action="/Development/SearchFuncViaDate" id="searchViaDate" method="post">
                    <input type="date" name="startDate" id="" class="inp" style="margin-right: 12px">
                    <input type="date" name="endData" id="" class="inp" style="margin-right: 12px">
                    <button type="submit" class="btn-small">Search</button>
                </form>
            </div>

            <div class="lowerBox">
                <div id="sortingBox">
                    <select name="" id="sortData">
                        <option value="newest">Newest First</option>
                        <option value="oldest">Oldest First</option>
                    </select>
                </div>
                <div class="tableBox">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Visiting ID</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Mobile Number</th>
                                <th scope="col">Aadhar Card Number</th>
                                <th scope="col">Purpose</th>
                                <th scope="col">Entry</th>
                                <th scope="col">Exit</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
        
                            <%	
                                ResultSet resultset = (ResultSet)session.getAttribute("entries");
                            	if(resultset != null)
                            	{
                            		for(int i = 1; resultset.next() == true; i++)
                                	{	
                                		String visitingID = resultset.getString("visiting_ID");
                                		String fName = resultset.getString("first_name");
                                		String lName = resultset.getString("last_name");
                                		String mobNum = resultset.getString("mob_num");
                                		String aadharNum = resultset.getString("aadhar_num");
                                		String purpose = resultset.getString("purpose");
                                		String entryTime = resultset.getString("entry_time");
                                		String exitTime = resultset.getString("exit_time");
                                		
                                		out.println("<tr>");
                                		
                                		out.println("<th scope='row'>"+ i + "</th>");
                                		out.println("<td>" + visitingID + "</td>");
                                		out.println("<td>" + fName + "</td>");
                                		out.println("<td>" + lName + "</td>");
                                		out.println("<td>" + mobNum + "</td>");
                                		out.println("<td>" + aadharNum + "</td>");
                                		out.println("<td>" + purpose + "</td>");
                                		out.println("<td>" + entryTime + "</td>");
                                		out.println("<td>" + exitTime + "</td>");
                                		
                                		out.println("<td><button type='button' class='btn-small editBtn'>Edit</button></td>");
                                		out.println("<td><button type='button' class='btn-small'>Exit</button></td>");
                                		
                                		out.println("</tr>");
                                	}
                            	}	
                            	session.removeAttribute("entries");
                            %>
                        </tbody>
                    </table>
                </div>

                <form action="/Development/DataLimit" id="dataQuantityForm" method="post">
                    <select name="dataQuantity" id="dataQuantitySelcTag">
                        <option value="oneMonth">1 Month</option>
                        <option value="threeMonths">3 Months</option>
                        <option value="sixMonths">6 Months</option>
                        <option value="oneYear">1 Year</option>
                        <option value="all">All</option>
                    </select>
                    <button type="submit" style="margin-right: 1rem" class="btn-small">Get Entries</button>
                </form>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
        <script src="../JavaScript/showDataSearchOption.js"></script>
        <script src="../JavaScript/showDataEditExitForm.js"></script>
        <script src="../JavaScript/showDataSorting.js"></script>
    </body>

    </html>