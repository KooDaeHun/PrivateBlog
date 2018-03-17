package kr.ac.daegu;

import java.io.Serializable;
import java.sql.Timestamp;

public class SaleLineDTO implements Serializable{
	private Integer sale_id;
	private Integer sale_line_id;
	private Integer item_id;
	private Timestamp update_time;
	private Integer quantity;
	
	public SaleLineDTO(Integer sale_id, Integer sale_line_id, Integer item_id, Timestamp update_time, Integer quantity) {
		super();
		this.sale_id = sale_id;
		this.sale_line_id = sale_line_id;
		this.item_id = item_id;
		this.update_time = update_time;
		this.quantity = quantity;
	}
	
	public Integer getSlae_id() {
		return sale_id;
	}
	public void setSlae_id(Integer slae_id) {
		this.sale_id = slae_id;
	}
	public Integer getSlae_line_id() {
		return sale_line_id;
	}
	public void setSlae_line_id(Integer slae_line_id) {
		this.sale_line_id = slae_line_id;
	}
	public Integer getItem_id() {
		return item_id;
	}
	public void setItem_id(Integer item_id) {
		this.item_id = item_id;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

}
