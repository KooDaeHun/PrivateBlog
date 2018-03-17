package kr.ac.daegu;

import java.io.Serializable;

public class ItemSet implements Serializable {
	private static final long serialVersionUID = 1L;
	private ItemDTO item;
	private Integer quantity;
	
	public ItemSet(ItemDTO item, Integer quantity) {
		this.item = item;
		this.quantity = quantity;
	}
	public void addQuantity(Integer addQuantity) {
		int addQuantityInt = addQuantity.intValue();
		int existQuantityInt = getQuantity().intValue();
		setQuantity(new Integer(addQuantity + existQuantityInt));
	}
	public ItemDTO getItem() {
		return this.item;
	}
	public void setItem(ItemDTO item) {
		this.item = item;
	}
	public Integer getQuantity() {
		return this.quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}
