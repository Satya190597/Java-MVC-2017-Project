package user;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.Myconnection;
public class NOTIFICATION 
{
	public static List<NOTIFICATION_BEAN> getNotification(int id)
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rst = null;
		List<NOTIFICATION_BEAN> mylist = new ArrayList<NOTIFICATION_BEAN>();
		try
		{
			con = Myconnection.getConncetion();
			String sql = "SELECT a.NOTIFICATION_ID,a.USERID,b.userName,a.DATE,a.TYPE FROM notification AS a,user AS b WHERE a.USERID=? AND b.userId=a.TOUSERID ORDER BY a.DATE desc";
			ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			rst = ps.executeQuery();
			while(rst.next())
			{
				NOTIFICATION_BEAN obj =  new NOTIFICATION_BEAN();
				obj.setDate(rst.getString("DATE"));
				obj.setName(rst.getString("userName"));
				obj.setType(rst.getString("TYPE"));
				obj.setNOTIFICATION_ID(rst.getInt("NOTIFICATION_ID"));
				mylist.add(obj);
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return mylist;
	}
}
