package kr.ac.daegu;

import java.util.List;

public class ShopImpl implements Shop {
	private ItemCatalog itemCatalog;
	
	public void setItemCatalog(ItemCatalog itemCatalog) {
		this.itemCatalog = itemCatalog;
	}
	
	@Override
	public List<ItemDTO> getItemList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ItemDTO getItemByItemId(Integer itemId) {
		// TODO Auto-generated method stub
		return null;
	}

}
