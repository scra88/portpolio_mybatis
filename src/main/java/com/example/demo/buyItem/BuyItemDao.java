package com.example.demo.buyItem;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface BuyItemDao {

	List<BuyItemVO> BuyItemList(BuyItemVO vo);
	void BuyItemInsert(BuyItemVO vo);
}
