package showEntries;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.*; // self made package


@WebServlet("/EditEntry")
public class EditEntry extends HttpServlet 
{
	private void ifNotAuthenticated(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {	
    	resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // tells browser to not store in cache
    	resp.setHeader("Pragma", "no-cache"); // for older version of http like http 1.0, etc
    	
    	HttpSession session = req.getSession();
    	if(session.getAttribute("loggedIn") == null)
    	{
    		resp.sendRedirect(req.getContextPath() + "/HTML/loginPage.html");
    	}
    }
	
	private void editEntry(String visitingID, String fName, String lName, String aadharNum, String purpose)
	{
		String query = "update entries set first_name = " + "'" + fName + "'" + ", last_name = " + "'" + lName + "'" + ", aadhar_num = " + "'" + aadharNum + "'" + ", purpose = " + "'" + purpose + "'" + "where visiting_ID = " + "'" + visitingID + "';";
		
		ConnectionDB.executeQuery(query);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		ifNotAuthenticated(req, resp);
		
		String visitingID = req.getParameter("visitingID");
		String fName = req.getParameter("firstName");
		String lName = req.getParameter("lastName");
		String aadharNum = req.getParameter("aadharNum");
		String purpose = req.getParameter("purpose");
		editEntry(visitingID, fName, lName, aadharNum, purpose);
		
		resp.sendRedirect(req.getContextPath() + "/showEntries_1");
	}

}
