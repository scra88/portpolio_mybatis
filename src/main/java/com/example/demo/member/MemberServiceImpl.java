package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao dao;

	@Override
	public MemberVO loginOK(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.loginOK(vo);
	}

	@Override
	public void RegisterOk(MemberVO vo) {
		dao.RegisterOk(vo);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return dao.getMember(vo);

	}


	@Override
	public void UpdateMoneyMember(MemberVO vo) {
		dao.UpdateMoneyMember(vo);
	}

}
