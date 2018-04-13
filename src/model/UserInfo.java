package model;

public class UserInfo {

	private String name;
	private int userID;
	
	public UserInfo(String name, int userID){
		this.name = name;
		this.userID = userID;
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
}
