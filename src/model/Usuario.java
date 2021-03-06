
package model;

public class Usuario {
private String userName;
private String firstName;
private String lastName;
private String phone;
private String email;
private String id; 


public Usuario(String userName, String firstName, String lastName, String phone, String email, String id) {
	super();
	this.userName = userName;
	this.firstName = firstName;
	this.lastName = lastName;
	this.phone = phone;
	this.email = email;
	this.id = id;
}


public Usuario(String userName, String firstName, String lastName, String phone, String email) {
	super();
	this.userName = userName;
	this.firstName = firstName;
	this.lastName = lastName;
	this.phone = phone;
	this.email = email;
}


public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getFirstName() {
	return firstName;
}
public void setFirstName(String firstName) {
	this.firstName = firstName;
}
public String getLastName() {
	return lastName;
}
public void setLastName(String lastName) {
	this.lastName = lastName;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}


}
