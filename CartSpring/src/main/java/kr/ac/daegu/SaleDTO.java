package kr.ac.daegu;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class SaleDTO implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Integer sale_id;
	private String user_id;
	private Timestamp update_time;
	private ArrayList<SaleLineDTO> saleLineList = new ArrayList<SaleLineDTO>();
	
	public void addSaleLine(SaleLineDTO saleLine) {
		this.saleLineList.add(saleLine);
	}
	public SaleDTO() {
		
	}
	
	public SaleDTO(Integer sale_id, String user_id, Timestamp updateTime, ArrayList<SaleLineDTO> saleLineList) {
		super();
		this.sale_id = sale_id;
		this.user_id = user_id;
		this.update_time = updateTime;
		this.saleLineList = saleLineList;
	}
	
	public Integer getSale_id() {
		return sale_id;
	}
	public void setSale_id(Integer sale_id) {
		this.sale_id = sale_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}
	public ArrayList<SaleLineDTO> getSaleLineList() {
		return saleLineList;
	}
	public void setSaleLineList(ArrayList<SaleLineDTO> saleLineList) {
		this.saleLineList = saleLineList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
