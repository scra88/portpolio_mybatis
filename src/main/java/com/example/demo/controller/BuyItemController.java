package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.buyItem.BuyItemServiceImpl;
import com.example.demo.buyItem.BuyItemVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BuyItemController {
	
	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	BuyItemServiceImpl service;

	@GetMapping("BuyItemList.do")
	String BuyItemList(Model model)
	{		
		BuyItemVO vo = new BuyItemVO();
		vo.setBuyername((String)session.getAttribute("login_id"));
		model.addAttribute("buy_item_list",service.BuyItemList(vo));
		return "BuyItemList";
	}

}
