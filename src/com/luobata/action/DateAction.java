package com.luobata.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.alibaba.fastjson.JSON;
import com.luobata.dao.DateDao;
import com.luobata.model.Source;
import com.luobata.util.DbUtil;
import com.luobata.util.JsonUtil;
import com.luobata.util.ResponseUtil;
import com.opensymphony.xwork2.ActionSupport;

public class DateAction extends ActionSupport{

	private ArrayList<Source> source=new ArrayList<Source>();
	private String JsonString;
	
	
	public ArrayList<Source> getSource() {
		return source;
	}
	public void setSource(ArrayList<Source> source) {
		this.source = source;
	}
	public String getJsonString() {
		return JsonString;
	}
	public void setJsonString(String jsonString) {
		JsonString = jsonString;
	}

	DbUtil dbutil=new DbUtil();
	DateDao dateDao= new DateDao();
	
	
	@Override
	public String execute() throws Exception {

		Connection con=null;
		try {
			con=dbutil.getCon();
			Source s=null;
			ResultSet rs=dateDao.dateList(con);
			while(rs.next()){
				s=new Source(rs.getInt(1),rs.getInt(2),rs.getInt(3),rs.getString(4));
				source.add(s);
			}
			JsonString =JSON.toJSONString(source);
			System.out.println(JsonString);
			//JSONObject result=new JSONObject();
			//JSONArray jsonArray=JsonUtil.formatRsToJsonArray(dateDao.dateList(con));
			//result.put("dateList", jsonArray);
			//ResponseUtil.write(ServletActionContext.getResponse(), result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return SUCCESS;
	}
	

}
