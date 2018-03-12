package kr.ac.pohang;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class JoinDAO {
private static SqlMapClient sqlMapper;
	
	public JoinDAO() {
		
	}
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException("TIME OVER"+e, e);
		}
	}
	public void insertUser(JoinDTO join) {
		try {
			sqlMapper.insert("insertUser", join);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public JoinDTO login(String id) {
		JoinDTO joinDTO = null;
		
		try {
			joinDTO = (JoinDTO)sqlMapper.queryForObject("login", id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return joinDTO;
	}
}
