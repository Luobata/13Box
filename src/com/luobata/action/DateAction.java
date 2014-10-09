package com.luobata.action;

import java.sql.Connection;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.luobata.dao.DateDao;
import com.luobata.util.DbUtil;
import com.luobata.util.JsonUtil;
import com.luobata.util.ResponseUtil;
import com.opensymphony.xwork2.ActionSupport;

public class DateAction extends ActionSupport{


	
	
	DbUtil dbutil=new DbUtil();
	DateDao dateDao= new DateDao();
	
	
	@Override
	public String execute() throws Exception {

		Connection con=null;
		try {
			con=dbutil.getCon();
			JSONObject result=new JSONObject();
			JSONArray jsonArray=JsonUtil.formatRsToJsonArray(dateDao.dateList(con));
			result.put("dateList", jsonArray);
			ResponseUtil.write(ServletActionContext.getResponse(), result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				dbutil.closeCon(con);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		return null;
	}
	

}
