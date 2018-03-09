package kr.ac.daegu;

import java.io.Serializable;

public class ItemDTO implements Serializable {
	private Integer item_ID;
	private String item_Name;
	private Integer price;
	private String description;
	private String picture_Url;
	
	public ItemDTO() {
		super();
	}
	public ItemDTO(Integer item_ID, String item_Name, Integer price, String description, String picture_Url) {
		super();
		this.item_ID = item_ID;
		this.item_Name = item_Name;
		this.price = price;
		this.description = description;
		this.picture_Url = picture_Url;
	}
	
	public Integer getItem_ID() {
		return item_ID;
	}
	public void setItem_ID(Integer item_ID) {
		this.item_ID = item_ID;
	}
	public String getItem_Name() {
		return item_Name;
	}
	public void setItem_Name(String item_Name) {
		this.item_Name = item_Name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPicture_Url() {
		return picture_Url;
	}
	public void setPicture_Url(String picture_Url) {
		this.picture_Url = picture_Url;
	}
	
	@Override
	public String toString() {
		return "ItemDTO [item_ID=" + item_ID + ", item_Name=" + item_Name + ", price=" + price + ", description="
				+ description + ", picture_Url=" + picture_Url + "]";
	}
	
}
