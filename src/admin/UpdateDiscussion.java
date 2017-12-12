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
@WebServlet("/UpdateDiscussion")
public class UpdateDiscussion extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//------ Object Creation ------------------
		UpdateDiscussion ob=new UpdateDiscussion();
		generateHTMl_Header(response);
		generateHTML(response,"Please Wait ...");
		//---------------------------------- Fetch The Parameter --------------------------------------------------
		String topic=request.getParameter("topic");
		String description=request.getParameter("description");
		int category=Integer.parseInt(request.getParameter("category"));
		String date=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		int id=Integer.parseInt(request.getParameter("id"));
		//----------------------------------------------------------------------------------------------------------
		if(ob.UpdateData(topic, description, category, date, id)!=0)
		{
			generateHTML(response,"Data Updated Successfully");
		}
		else
		{
			generateHTML(response,"Failed To Update Data");
		}
		generateHTMl_Footer(response);
	}
	
	//----------------------------------------- Function to update Discussion ----------------------------------------------------------
	public int UpdateData(String topic,String description,int category,String date,int id)
	{
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		try
		{
			con=Myconnection.getConncetion();
			String sql="UPDATE discussion SET discussionTopic=?,discussionDescription=?,discussionCategory=?,discussionDate=? WHERE discussionId=?";
			ps=con.prepareStatement(sql);
			ps.setString(1,topic);
			ps.setString(2,description);
			ps.setInt(3,category);
			ps.setDate(4,java.sql.Date.valueOf(date));
			ps.setInt(5,id);
			result=ps.executeUpdate();
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
	//------------------------------------------------------------------------------------------------------------------------------------------
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
		out.println("<h1 class='uk-text-primary'>"+text+"</h1>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
