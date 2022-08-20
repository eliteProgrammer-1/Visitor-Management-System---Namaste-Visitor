package Verification;


import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Properties;
import Verification.SendOTPOnMobile; // self made class
import database.*; // self made package

@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet 
{	
	
	private static void sendEmail(String sub, String mssg, String to, String from) 
	{
        String password = "xidripgdfxbfbuap";     
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
         
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
        {
        	protected PasswordAuthentication getPasswordAuthentication() 
            {
        		return new PasswordAuthentication(from, password);
            }
        });
         
          try 
          {
              MimeMessage message = new MimeMessage(session);
              message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
              message.setSubject(sub);
              message.setText(mssg);
              
              //send message
              Transport.send(message);
              System.out.println(mssg);
          } 
          catch (MessagingException e) 
          {
        	  throw new RuntimeException(e);
          }
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String fromEmail = "sharmamanish16111999@gmail.com";
		String toEmail = req.getParameter("email");
		String name = req.getParameter("firstName") + " " + req.getParameter("lastName");
		String subject = "Namaste " + name + "!";
			
		String OTP = SendOTPOnMobile.generateOTP();
		try 
		{
			while(SendOTPOnMobile.is_OTP_unique(OTP) == false)
			{
				OTP = SendOTPOnMobile.generateOTP();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		
		String mssg = "Hey " + name + "!\nYour OTP For Namaste Visitor : " + OTP;
		sendEmail(subject, mssg, toEmail, fromEmail);
		
		String query = "insert into otp values(" + "'" + OTP + "', " + "null, " + "'" + toEmail + "'" + ");";
		ConnectionDB.executeQuery(query);
		resp.sendRedirect(req.getContextPath() + "/JSP_Files/emailSent.jsp");
	}

}
