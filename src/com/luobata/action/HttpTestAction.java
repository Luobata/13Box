package com.luobata.action;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.luobata.model.Source;
import com.luobata.model.User;
import com.opensymphony.xwork2.ActionSupport;

public class HttpTestAction extends ActionSupport{

	private User user;
	private String json;
	private List<Source> source=new ArrayList();
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

	public String add(){
		Source s=null;
		System.out.println(json);
		//user.setUserId(1);
		System.out.println("100");
		User user2=null;
		try {
			source=JSON.parseArray(json,Source.class);
			System.out.println(source);
			System.out.println(source.get(0).getDate());
			//user2=JSON.parseObject(json,User.class);
			//System.out.println(user2.getUserIp());
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(user.getUserId());
		//System.out.println(user.getUserIp());
		//System.out.println(user.getMessage());
		return null;
	}
	
}
