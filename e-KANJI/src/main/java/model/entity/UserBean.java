package model.entity;

import java.io.Serializable;

public class UserBean implements Serializable {
	private String userId;
	private String userName;
	private String userPass;
	private int UserChoice;
	private int UserStop;

	public UserBean() {

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public int getUserChoice() {
		return UserChoice;
	}

	public void setUserChoice(int userChoice) {
		UserChoice = userChoice;
	}

	public int getUserStop() {
		return UserStop;
	}

	public void setUserStop(int userStop) {
		UserStop = userStop;
	}

}
