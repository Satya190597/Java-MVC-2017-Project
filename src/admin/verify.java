package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import connection.Myconnection;
@WebServlet(name = "Verify", urlPatterns = { "/Verify" })
public class verify extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		generateHTMl_Header(response);
		generateHTML(response,"Please Wait ...");
		int postId=Integer.parseInt(request.getParameter("postId"));
		int adminId=Integer.parseInt(request.getParameter("adminId"));
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			con=Myconnection.getConncetion();
			String sql="INSERT INTO verifypost VALUES(?,?,now())";
			ps=con.prepareStatement(sql);
			ps.setInt(1,postId);
			ps.setInt(2,adminId);
			if(ps.executeUpdate()!=0)
			{
				generateHTML(response,"Post Successfully Verified");
			}
			else
			{
				generateHTML(response,"Failed Verified This Particular Post");
			}
			generateHTMl_Footer(response);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				if(ps!=null)
				{
					ps.close();
				}
				if(con!=null)
				{
					con.close();
				}
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
		}
	}
	protected static void generateHTMl_Header(HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel='stylesheet' href='uikit/css/uikit.min.css' />");
		out.println("<script src='uikit/js/uikit.min.js'></script>");
		out.println("<title>Confirmation Page</title>");
		out.println("</head>");
		out.println("<body>");
	}
	protected static void generateHTMl_Footer(HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<a class='uk-link-reset' href='Admin.jsp'>Admin Dashboard</a>");
		out.println("</div>");
		out.println("</body>");
		out.println("</html>");
	}
	protected static void generateHTML(HttpServletResponse response,String text) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<div class='uk-container'>");
		out.println("<h1 class='uk-text-primary'>"+text+"</h1>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
