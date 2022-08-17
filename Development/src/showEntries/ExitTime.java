package showEntries;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.*; // self made package
import security.MakeEntry;

@WebServlet("/ExitTime")
public class ExitTime extends HttpServlet {
	
	private void setExitTime(String visitingID)
	{
		Date date = new Date();
		SimpleDateFormat ft =  new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        String exitTime = ft.format(date);
        
        System.out.println(visitingID + " " + exitTime);
        
        String query = "update entries set exit_time = " + "'" + exitTime + "'" + "where visiting_ID = " + "'" + visitingID + "';";
        ConnectionDB.executeQuery(query);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String visitingID = req.getParameter("visitingID");
		setExitTime(visitingID);
		resp.sendRedirect(req.getContextPath() + "/showEntries_1");
	}

}
