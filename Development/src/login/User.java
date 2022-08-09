package login;

import java.io.*;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/HTML/login-verification")
public class User extends HttpServlet
{
    private String emp_id, password;
    private boolean isSecurityPersonnel, isHR, isEmployee;
    
    public User()
    {
        this.emp_id = "";
        this.password = "";
        isSecurityPersonnel = false;
        isEmployee = false;
        isHR = false;
    }
    
    public void setUserType(String user_type)
    {
    	if((user_type.toLowerCase()).equals("hr"))
    	{
    		this.isHR = true;
    	}
    	else if((user_type.toLowerCase()).equals("security"))
    	{
    		this.isSecurityPersonnel = true;
    	}
    	else if((user_type.toLowerCase()).equals("employee"))
    	{
    		this.isEmployee = true;
    	}
    }
    
    
    public void redirectAccordingToUserType(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {	
    	if(this.isSecurityPersonnel == true)
        {	
            resp.sendRedirect(req.getContextPath() + "/JSP_Files/security.jsp");
        }
    }
    
    
    public boolean isAuthenticated(String emp_id, String password)
    {   
        String databaseURL = "jdbc:mysql://localhost:3306/namaste_visitor";
        String databaseUserName = "root";
        String databasePassword = "1234";
        String query = "select * from login where emp_id=? and password=?;";

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(databaseURL, databaseUserName, databasePassword);

            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, emp_id);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next() == true)
            {	
            	String user_type = resultSet.getString("user_type");
            	setUserType(user_type);
                return true;
            }
        }
        catch(Exception e)
        {
        	
        }
        return false;
    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {	
    	resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // (HTTP 1.1) tells browser to not store this page in cache
    	resp.setHeader("Pragma", "no-cache"); // for older versions of HTTP
    	
        this.emp_id = req.getParameter("emp_id");
        this.password = req.getParameter("password");
        
        if(isAuthenticated(this.emp_id, this.password) == true)
        {	
        	HttpSession session = req.getSession();
        	session.setAttribute("loggedIn", true);
        	session.setAttribute("emp_id", emp_id);
        	
        	redirectAccordingToUserType(req, resp);
        }
        else
        {
        	resp.sendRedirect("/Development/HTML/loginPage.html");
        }
    }
}