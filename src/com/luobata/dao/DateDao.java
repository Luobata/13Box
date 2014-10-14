package com.luobata.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.luobata.model.Test;

public class DateDao {

	public ResultSet dateList(Connection con) throws Exception{
		
		String sql="SELECT * FROM 13_source ORDER BY source_id DESC LIMIT 7";
		PreparedStatement pstmt=con.prepareStatement(sql);
		return pstmt.executeQuery();
		
	}
}
