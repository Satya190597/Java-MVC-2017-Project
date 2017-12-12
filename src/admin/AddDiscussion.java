/**
 * AddDiscussion
 * Objective
 * 1 Add Discussion to discussion table
 * 2 Return 0 or 1 to addDiscussion.jsp as url parameter
 * Function Used
 * 1 saveData(String topic,String description,int category,String date,int adminId);
 * Imported Class
 * 1 connection.Myconnection
 * Author : Satya Prakash Nandy
 * Date   : 31-10-2017
 */
package admin;
//---------------------- Importing All The Packages ----------------------
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

import connection.Myconnection;
//------------------------------------------------------------------------
@WebServlet("/AddDiscussion")
public class AddDiscussion extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		generateHTMl_Header(response);
		generateHTML(response,"Please Wait ...");
		//================ Initializing Variables ================
		String topic = request.getParameter("topic");
		String description = request.getParameter("description");
		int category = Integer.parseInt(request.getParameter("category"));
		String date = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		int adminId = Integer.parseInt(request.getParameter("adminId"));
		//=======================================================
		
		if(AddDiscussion.saveData(topic, description, category, date, adminId)!=0)
		{
			generateHTML(response,"Data Successfully Saved");
		}
		else
		{
			generateHTML(response,"Failed To Save Data");
		}
		generateHTMl_Footer(response);
	}
	public static int saveData(String topic,String description,int category,String date,int adminId)
	{
		//================ Initializing Variables ================
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		//=======================================================
		
		try
		{
			con = Myconnection.getConncetion();
			String sql = "INSERT INTO discussion VALUES(null,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1,topic);
			ps.setString(2,description);
			ps.setInt(3,category);
			ps.setDate(4,java.sql.Date.valueOf(date));
			ps.setInt(5,adminId);
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
				return 0;
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
		out.println("<h1 class='uk-text-primary'>"+text+"</h1>");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
