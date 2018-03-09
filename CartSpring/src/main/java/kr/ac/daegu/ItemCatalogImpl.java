package kr.ac.daegu;

import java.util.List;

public class ItemCatalogImpl implements ItemCatalog {
	private ItemDao itemDao;
	
	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}

	@Override
	public List<ItemDTO> getItemList(){
		return null;
	}
	
}
