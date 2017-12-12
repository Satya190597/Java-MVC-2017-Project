package user;

public class NOTIFICATION_BEAN 
{
	String name=null,type=null,date=null;
	int NOTIFICATION_ID=0;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public int getNOTIFICATION_ID() 
	{
		return NOTIFICATION_ID;
	}

	public void setNOTIFICATION_ID(int nOTIFICATION_ID) 
	{
		NOTIFICATION_ID = nOTIFICATION_ID;
	}

	public void setType(String type) 
	{
		this.type = type;
	}

	public String getDate() 
	{
		return date;
	}

	public void setDate(String date) 
	{
		this.date = date;
	}
}
