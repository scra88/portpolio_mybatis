package com.example.demo.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardDao {

	List<BoardVO> getBoardList();
	void insertBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	void updateImgBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
}
