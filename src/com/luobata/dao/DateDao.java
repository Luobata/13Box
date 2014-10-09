package com.luobata.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.luobata.model.Test;

public class DateDao {

	public ResultSet dateList(Connection con) throws Exception{
		
		String sql="select * from test";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
		
	}
}
