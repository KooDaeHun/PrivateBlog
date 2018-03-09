package kr.ac.daegu;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.springframework.stereotype.Service;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

@Service
public class SaleDAO {
	private static SqlMapClient sqlMapper;
	public SaleDAO() {
		
	}
	static {
		try {
			Reader reader = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			System.out.println("sqlMapper 연결 성공 : "+sqlMapper);
			reader.close();
		} catch (IOException e) {
			throw new RuntimeException("Something bad happened while building the SqlMapClient instance"+e, e);
		}
		
	}
	public void insertSale(SaleDTO sale) {
		try {
			sqlMapper.insert("insertSale",sale);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Integer findMaxSaleId() {
		int max=0;
		
		try {
			max = (Integer)sqlMapper.queryForObject("selectMaxSaleId");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}
}
