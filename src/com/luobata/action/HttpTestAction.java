package com.luobata.action;

import com.luobata.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class HttpTestAction extends ActionSupport{

	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String add(){
		
		System.out.println(user.getUserId());
		System.out.println(user.getUserIp());
		System.out.println(user.getMessage());
		return null;
	}
	
}
