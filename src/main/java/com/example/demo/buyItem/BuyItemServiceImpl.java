package com.example.demo.buyItem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyItemServiceImpl implements BuyItemService {

	@Autowired
	BuyItemDao dao;
	


	@Override
	public void BuyItemInsert(BuyItemVO vo) {
		dao.BuyItemInsert(vo);
		
	}


	@Override
	public List<BuyItemVO> BuyItemList(BuyItemVO vo) {
		// TODO Auto-generated method stub
		return dao.BuyItemList(vo);
	}
	
}
