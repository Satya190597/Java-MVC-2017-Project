package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import post.POST_BEAN;
import connection.Myconnection;

@WebServlet(name = "Admin_GetUserPost", urlPatterns = { "/Admin_GetUserPost" })
public class Admin_GetUserPost extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int categoryId=Integer.parseInt(request.getParameter("categoryId"));
		List<POST_BEAN> mylist=new ArrayList<POST_BEAN>();
		mylist=getPostList(categoryId);
		request.setAttribute("mylistUnverifiedPost",mylist);
		//request.getRequestDispatcher("adminVerification.jspmyformVisit").include(request,response);
		request.getRequestDispatcher("Admin.jsp?goto=verifypost").include(request,response);
	}
	protected static List<POST_BEAN> getPostList(int id)
	{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rst=null;
		List<POST_BEAN> mylist=new ArrayList<POST_BEAN>();
		try
		{
			con=Myconnection.getConncetion();
			String sql="SELECT * FROM userpost WHERE categoryId=? AND postId NOT IN (SELECT postId FROM verifyPost) ORDER BY date DESC";
			ps=con.prepareStatement(sql);
			ps.setInt(1,id);
			rst=ps.executeQuery();	
			while(rst.next())
			{
				POST_BEAN obj=new POST_BEAN();
				obj.setPostId(rst.getInt("postId"));
				obj.setAdminId(rst.getInt("userId"));
				obj.setName(rst.getString("postName"));
				obj.setBody(rst.getString("postBody"));
				obj.setWork(rst.getString("postWork"));
				obj.setCategoryId(rst.getInt("categoryId"));
				mylist.add(obj);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return mylist;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
