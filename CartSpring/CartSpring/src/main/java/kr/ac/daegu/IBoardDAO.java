package kr.ac.daegu;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class IBoardDAO {
	private static SqlMapClient sqlMapper;
	public IBoardDAO() {
		
	}
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			System.out.println("sqlMapper 연결 성공 : "+sqlMapper);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("Something bad happened while building the SqlMapclient instance."+e, e);
		}
		
	}
	public List selectAll() {
		try {
			List list = sqlMapper.queryForList("selectAll");
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public ItemDTO selectOne(int item_ID) {
		ItemDTO item = null;
		
		try {
			item = (ItemDTO)sqlMapper.queryForObject("selectOne", item_ID);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return item;
	}
	public UserDTO selectTwo(String user_id) {
		UserDTO user = null;
		
		try {
			user = (UserDTO)sqlMapper.queryForObject("selectTwo",user_id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	public void delete(String title) {
		try {
			int n = sqlMapper.delete("delete",title);
			System.out.println("delete n = "+n);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void insertUser(UserDTO user) {
		try {
			sqlMapper.insert("insertUser",user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
