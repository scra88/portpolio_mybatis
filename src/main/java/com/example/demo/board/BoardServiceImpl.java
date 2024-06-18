package com.example.demo.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardVO> getBoardList() {
		// TODO Auto-generated method stub
		return dao.getBoardList();
	}

	@Override
	public void insertBoard(BoardVO vo) {
		dao.insertBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		dao.deleteBoard(vo);
	}


	@Override
	public BoardVO getBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return dao.getBoard(vo);
	}

	@Override
	public void updateImgBoard(BoardVO vo) {
		dao.updateImgBoard(vo);
	}

}
