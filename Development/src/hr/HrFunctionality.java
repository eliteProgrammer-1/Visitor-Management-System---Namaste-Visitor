package hr;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/HrFunctionality")
public class HrFunctionality extends HttpServlet
{	
	private void redirectAccordingToOption(String choosedOption, HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		if(choosedOption.equals("newJoinee") == true)
		{
			resp.sendRedirect(req.getContextPath() + "/JSP_Files/newJoineeForm.jsp");
		}
		else if(choosedOption.equals("invite") == true)
		{
			resp.sendRedirect(req.getContextPath() + "");
		}
		else
		{
			resp.sendError(1, "Don't make changes with HTML. Invalid Option");
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException
	{
		String selectedOption = req.getParameter("chooseOption");
		redirectAccordingToOption(selectedOption, req, resp);
	}
}
