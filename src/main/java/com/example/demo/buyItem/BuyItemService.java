package com.example.demo.buyItem;

import java.util.List;

public interface BuyItemService {
	List<BuyItemVO> BuyItemList(BuyItemVO vo);
	void BuyItemInsert(BuyItemVO vo);
}
