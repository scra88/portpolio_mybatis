package com.example.demo.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
	void RegisterOk(MemberVO vo);
	void UpdateMoneyMember(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	MemberVO loginOK(MemberVO vo);
}
