package model;

public class UserInfo {

	private String name;
	private String APIKey;
	private int userID;
	private int type;
	
	public UserInfo(String name, int userID){
		this.name = name;
		this.userID = userID;
	}
	

	public UserInfo(String name, int userID, int type) {
		super();
		this.name = name;
		this.userID = userID;
		this.type = type;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getAPIKey() {
		return APIKey;
	}

	public void setAPIKey(String aPIKey) {
		APIKey = aPIKey;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
}
