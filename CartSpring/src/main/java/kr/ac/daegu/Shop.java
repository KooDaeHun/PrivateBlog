package kr.ac.daegu;

import java.util.List;

public interface Shop {
	List<ItemDTO> getItemList();
	ItemDTO getItemByItemId(Integer itemId);
}
