package post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import user.PostBean;
import connection.Myconnection;
public class NEWS_HEADLINES 
{
	public static List<PostBean> getHeadlines()
	{
		Connection con=null;
		PreparedStatement ps = null;
		ResultSet rst = null;
		List<PostBean> mylist = new ArrayList<PostBean>();
		try
		{
			con = Myconnection.getConncetion();
			String sql = "SELECT admin_postName FROM adminpost ORDER BY admin_postPublishDate DESC LIMIT 10";
			ps = con.prepareStatement(sql);
			rst = ps.executeQuery();
			while(rst.next())
			{
				PostBean obj= new PostBean();
				obj.setPostName(rst.getString("admin_postName"));
				mylist.add(obj);
			}
		}
		catch(SQLException e)
		{
			
		}
		return mylist;
	}
}
