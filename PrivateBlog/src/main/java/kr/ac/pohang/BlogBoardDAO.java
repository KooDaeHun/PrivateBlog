package kr.ac.pohang;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class BlogBoardDAO {
	private static SqlMapClient sqlMapper;
	
	public BlogBoardDAO() {
		
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
	public List boardAll() {
		List list = null;
		try {
			list = sqlMapper.queryForList("boardAll");
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public List boardSearch(String title) {
		List list = null;
		try {
			list = sqlMapper.queryForList("boardSearch", title);
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public void insertBoard(BlogBoardDTO boardDTO) {
		try {
			sqlMapper.insert("insertBoard", boardDTO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public BlogBoardDTO getContent(Integer num) {
		BlogBoardDTO boardDTO = null;
		try {
			boardDTO = (BlogBoardDTO)sqlMapper.queryForObject("getContent", num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return boardDTO; 
	}
	public String today() {
		String now = null;
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
		now = formatter.format(new java.util.Date());
		System.out.println(now);
		return now;
	}
	
}
