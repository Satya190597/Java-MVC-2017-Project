package user;

import java.io.IOException;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.PreparedStatement;
import connection.Myconnection;
@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rst = null;
		String email = request.getParameter("email");
		String password = null;
		try
		{
			con = Myconnection.getConncetion();
			String sql = "SELECT userPassword FROM user WHERE userEmail=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,email);
			rst = ps.executeQuery();
			while(rst.next())
			{
				password = rst.getString("userPassword");
			}
			if(password!=null)
			{
				if(SendEmail(password,email)!=0)
					response.sendRedirect("ForgetPassword.jsp?status=Check your mail to get your password or try again later");
				else
					response.sendRedirect("ForgetPassword.jsp?status=Password might be already send check your mail");
			}
			else
			{
				response.sendRedirect("ForgetPassword.jsp?status=The email id you provided is not registered");
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected static int SendEmail(String password,String email)
	{
		final String from = "150301120035@cutm.ac.in";
	 	final String verifypassword = "19051997";
	    String to = email;
	    String subject = "Democratic Get Your Password";
	    String body = "Your Password : "+password;
	    Properties properties = new Properties();
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "465");
        try
        {
            Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator() 
            {
                protected PasswordAuthentication getPasswordAuthentication() 
                {
                    return new PasswordAuthentication(from, verifypassword);
                }
            });
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(body);
            Transport.send(message);
        } 
        catch (Exception e) 
        {
        	e.printStackTrace();
        	return 0;
        }
        return 1;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
