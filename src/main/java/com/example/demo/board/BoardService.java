package com.example.demo.board;

import java.util.List;

public interface BoardService {

	List<BoardVO> getBoardList();
	void insertBoard(BoardVO vo);
	void deleteBoard(BoardVO vo);
	void updateImgBoard(BoardVO vo);
	BoardVO getBoard(BoardVO vo);
}
