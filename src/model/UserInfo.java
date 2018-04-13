package model;

public class UserInfo {

	private String name;
	private String userID;
	
	public UserInfo(String name, String userID){
		this.name = name;
		this.userID = userID;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
}
