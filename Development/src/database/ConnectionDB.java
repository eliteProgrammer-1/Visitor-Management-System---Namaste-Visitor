package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConnectionDB 
{
	private static String databaseURL = "jdbc:mysql://localhost:3306/namaste_visitor";
	private static String databaseUserName = "root";
	private static String databasePassword = "1234";
	
	public static ResultSet getResult(String query, String[] queryConditionVars)
	{
		try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(databaseURL, databaseUserName, databasePassword);
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            
            for(int i = 0; i < queryConditionVars.length; i++)
            {
            	 preparedStatement.setString(i + 1, queryConditionVars[i]);
            }
            ResultSet resultSet = preparedStatement.executeQuery();
            return resultSet;
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
		return null; // if something happened wrong resultset will be not initialized
	}
}
