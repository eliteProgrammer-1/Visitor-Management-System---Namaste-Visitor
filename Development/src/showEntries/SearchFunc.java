package showEntries;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.*; // self made package

@WebServlet("/SearchFunc")
public class SearchFunc extends HttpServlet 
{	
	
	private ResultSet getEntries(String searchType, String inpWord)
	{	
		String query = null;
		inpWord = inpWord.toLowerCase();
		
		if(searchType.equals("visitingID") == true)
		{
			query = "select * from entries where visiting_ID = " + "'" + inpWord + "';";
		}
		else if(searchType.equals("name") == true)
		{			
			query = "select * from " + "(select *,  " + "CONCAT(first_name , ' ' , last_name)" + " as full_name from entries) tb where full_name like " + "'" + inpWord + "%';";
		}
		else if(searchType.equals("mobNum") == true)
		{
			query = "select * from entries where mob_num = " + "'" + inpWord + "';";
		}
		else if(searchType.equals("aadharNum") == true)
		{
			query = "select * from entries where aadhar_num = " + "'" + inpWord + "';";
		}
		
		return ConnectionDB.executeQueryResultSet(query);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String searchType = req.getParameter("searchBy");
		String inpWord = req.getParameter("inpWord");
		
		ResultSet resultset = getEntries(searchType, inpWord);
	
		HttpSession session = req.getSession();
		session.setAttribute("entries", resultset);
		
		resp.sendRedirect(req.getContextPath() + "/JSP_Files/showData.jsp");
	}

}
