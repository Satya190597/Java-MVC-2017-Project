package admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class AdminUpdatePost
 */
@WebServlet("/AdminUpdatePost")
@MultipartConfig
public class AdminUpdatePost extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter pw=response.getWriter();
		pw.println("Please Wait ....");

		AdminAddPostBean apb_obj=new AdminAddPostBean();
		AdminAddPost ap_obj=new AdminAddPost();
		AdminUpdatePostClass aupc_obj=new AdminUpdatePostClass();
		
		int id=Integer.parseInt(request.getParameter("id"));
		
		apb_obj.setPostId(id);
		apb_obj.setName(request.getParameter("name"));
		apb_obj.setCategoryId(Integer.parseInt(request.getParameter("category")));
		apb_obj.setBody(request.getParameter("body"));
		apb_obj.setWork(request.getParameter("work"));
		apb_obj.setImage1(ap_obj.myInputStream(request.getPart("image1")));
		apb_obj.setImage2(ap_obj.myInputStream(request.getPart("image2")));
		apb_obj.setVideo1(ap_obj.myInputStream(request.getPart("video1")));
		apb_obj.setDate(request.getParameter("date"));
		int result=aupc_obj.UpdatePost(apb_obj);
		if(result>0)
		{
			pw.println("Data Updated...");
		}
	}
	protected InputStream myInputStream(Part content)
	{
		InputStream mystream=null;
		try
		{
			mystream=content.getInputStream();
			return mystream;
		}
		catch(IOException e)
		{
			e.printStackTrace();
			return null;	
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);
	}
}
