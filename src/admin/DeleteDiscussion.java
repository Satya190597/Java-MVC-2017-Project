package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import connection.Myconnection;

@WebServlet("/DeleteDiscussion")
public class DeleteDiscussion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		generateHTMl_Header(response);
		generateHTML(response,"Please Wait ...");
		int id = Integer.parseInt(request.getParameter("id"));
		if(DeleteDiscussion.deletePost(id)!=0)
		{
			generateHTML(response,"Discussion Deleted Successfully");
		}
		else
		{
			generateHTML(response,"Failed To Delete This Particular Discussion");
		}
		generateHTMl_Footer(response);
	}
	public static int deletePost(int id)
	{
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		try
		{
			con = Myconnection.getConncetion();
			String sql = "DELETE FROM discussion WHERE discussionId=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			result = ps.executeUpdate();
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
		return result;
	}
	protected static void generateHTMl_Header(HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel='stylesheet' href='uikit/css/uikit.min.css' />");
		out.println("<script src='uikit/js/uikit.min.js'></script>");
		out.println("<script src='javascript/addNews.js'></script>");
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
		out.println("<h1 class='uk-text-danger'>"+text+"</h1>");
	}
}
