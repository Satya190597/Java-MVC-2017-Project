package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.Myconnection;

/**
 * Servlet implementation class DiVerify
 */
@WebServlet("/DiVerify")
public class DiVerify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		generateHTMl_Header(response);
		generateHTML(response,"Please Wait ...");
		int postId=Integer.parseInt(request.getParameter("postId"));
		Connection con=null;
		PreparedStatement ps=null;
		try
		{
			con=Myconnection.getConncetion();
			String sql="DELETE FROM verifypost WHERE postId=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1,postId);
			ps.executeUpdate();
			if(ps.executeUpdate()!=0)
			{
				generateHTML(response,"Post Successfully De-Verified");
			}
			else
			{
				generateHTML(response,"Failed To De-Verified This Particular Post");
			}
			generateHTMl_Footer(response);
		}
		catch(SQLException e)
		{
			e.printStackTrace();
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
