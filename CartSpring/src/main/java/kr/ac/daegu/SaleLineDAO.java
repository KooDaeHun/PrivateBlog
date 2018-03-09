package kr.ac.daegu;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

@Service
public class SaleLineDAO {
	private static SqlMapClient sqlMapper;
	public SaleLineDAO() {
		
	}
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			System.out.println("sqlMapper 연결 성공 : "+sqlMapper);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("Something bad happended while building the sqlMapClient instance."+e, e);
		}
	}
	public void insertSaleLine(SaleLineDTO saleline) {
		try {
			sqlMapper.insert("insertSaleLine",saleline);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
