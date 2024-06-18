package com.example.demo.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.board.BoardServiceImpl;
import com.example.demo.board.BoardVO;
import com.example.demo.buyItem.BuyItemServiceImpl;
import com.example.demo.buyItem.BuyItemVO;
import com.example.demo.member.MemberServiceImpl;
import com.example.demo.member.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class BoardController {

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	private BoardServiceImpl service;

	@Autowired
	private MemberServiceImpl member_service;

	@Autowired
	private BuyItemServiceImpl buyitem_service;

	@GetMapping("index.do")
	String index(Model model) {
		MemberVO vo = new MemberVO();
		vo.setName((String) session.getAttribute("login_id"));
		model.addAttribute("login_info", member_service.getMember(vo));
		return "index";
	}

	@GetMapping("getBoardList.do")
	String getBoardList(Model model) {
		if (!login_status()) {
			return "redirect:need_login.do";
		} else {
			MemberVO vo = new MemberVO();
			vo.setName((String) session.getAttribute("login_id"));
			model.addAttribute("login_info", member_service.getMember(vo));
			model.addAttribute("board_list", service.getBoardList());
			return "getBoardList";
		}
	}

	@GetMapping("need_login.do")
	String need_login() {
		return "need_login";
	}

	@GetMapping("admin_only")
	String admin_only() {
		return "admin_only";
	}

	@GetMapping("PostForm.do")
	String PostForm() {
		if (!login_status()) {
			return "redirect:need_login.do";
		} else if (!admin_status()) {
			return "redirect:admin_only";
		} else {
			return "PostForm";
		}
	}

	@GetMapping("Post_Fail.do")
	String Post_Fail() {
		return "post_fail";
	}

	@GetMapping("abnormal.do")
	String abnormal_page() {
		return "abnormal_page";
	}

	@GetMapping("item_buy_fail.do")
	String item_buy_fail() {
		return "item_buy_fail";
	}

	@GetMapping("item_buy_success.do")
	String item_buy_success() {
		return "item_buy_success";
	}

	@PostMapping("PostFormOk.do")
	String PostFormOk(@Valid BoardVO vo) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/img/");
		MultipartFile file = vo.getFile();
		String extension = StringUtils.getFilenameExtension(file.getOriginalFilename());
		String fileName = System.currentTimeMillis() + "." + extension; // 파일명 바꾸기
		switch (extension) {
		case "PNG":
		case "png":
		case "BMP":
		case "bmp":
		case "JPEG":
		case "jpeg":
		case "JPG":
		case "jpg":
			file.transferTo(new File(path + fileName));
			vo.setImg(fileName);
			service.insertBoard(vo);
			break;
		default:
			return "redirect:Post_Fail.do";
		}
		return "redirect:getBoardList.do";
	}

	@PostMapping("deleteBoardOk.do")
	String deleteBoardOk(BoardVO vo) {
		if (!login_status()) {
			return "redirect:need_login.do";
		} else if (!admin_status()) {
			return "redirect:admin_only";
		} else {
			String path = request.getSession().getServletContext().getRealPath("/img/");
			File removeFile = new File(path + service.getBoard(vo).getImg());
			removeFile.delete();
			service.deleteBoard(vo);
			return "redirect:getBoardList.do";
		}
	}

	@GetMapping("getBoardUpdateForm.do")
	String getBoardUpdateForm(Model model, BoardVO vo) {
		if (!login_status()) {
			return "redirect:need_login.do";
		} else if (!admin_status()) {
			return "redirect:admin_only";
		} else {
			model.addAttribute("board_info", service.getBoard(vo));
			return "getBoardUpdateForm";
		}
	}

	@PostMapping("getBoardUpdateOk.do")
	String getBoardUpdateOk(@Valid BoardVO vo) throws IllegalStateException, IOException {
		String path = request.getSession().getServletContext().getRealPath("/img/");
		MultipartFile file = vo.getFile();
		String extension = StringUtils.getFilenameExtension(file.getOriginalFilename());
		String fileName = System.currentTimeMillis() + "." + extension; // 파일명 바꾸기
		if (file.isEmpty()) {
			vo.setImg(service.getBoard(vo).getImg());
			service.updateImgBoard(vo);
			return "redirect:getBoardList.do";
		} else {
			switch (extension) {
			case "PNG":
			case "png":
			case "BMP":
			case "bmp":
			case "JPEG":
			case "jpeg":
			case "JPG":
			case "jpg":
				File removeFile = new File(path + service.getBoard(vo).getImg());
				removeFile.delete();
				file.transferTo(new File(path + fileName));
				vo.setImg(fileName);
				service.updateImgBoard(vo);
				break;
			default:
				return "redirect:Post_Fail.do";
			}
		}

		return "redirect:getBoardList.do";
	}

	@GetMapping("getBoard.do")
	String getBoard(Model model, BoardVO vo) {
		if (!login_status()) {
			return "redirect:need_login.do";
		} else if (service.getBoard(vo) == null) {
			return "redirect:abnormal.do";
		} else {
			model.addAttribute("board", service.getBoard(vo));
			return "getBoard";
		}
	}

	@PostMapping("BuyItemOk.do")
	String BuyItemOk(BoardVO vo) throws IllegalStateException, IOException {

		MemberVO membervo = new MemberVO();
		membervo.setName((String) session.getAttribute("login_id"));
		MemberVO getmembervo = member_service.getMember(membervo);
		BoardVO getboardvo = service.getBoard(vo);

		if (getmembervo.getMoney() < getboardvo.getPrice()) {
			return "redirect:item_buy_fail.do";
		} else {
			getmembervo.setMoney(getmembervo.getMoney() - getboardvo.getPrice());
			BuyItemVO buyitemvo = new BuyItemVO();
			buyitemvo.setItemid(getboardvo.getId());
			buyitemvo.setBuyername(membervo.getName());
			buyitemvo.setPrice(getboardvo.getPrice());
			buyitemvo.setImg(getboardvo.getImg());
			String path = request.getSession().getServletContext().getRealPath("/img/");
			String Newpath = request.getSession().getServletContext().getRealPath("/BuyItemListimg/");
			File file = new File(path + getboardvo.getImg());
			File newFile = new File(Newpath + getboardvo.getImg());
			Files.copy(file.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

			buyitem_service.BuyItemInsert(buyitemvo);
			member_service.UpdateMoneyMember(getmembervo);
			return "redirect:item_buy_success.do";
		}
	}

	private boolean login_status() {
		if (session.getAttribute("login_id") != null) {
			return true;
		} else {
			return false;
		}
	}

	private boolean admin_status() {
		MemberVO vo = new MemberVO();
		vo.setName((String) session.getAttribute("login_id"));
		if (login_status()) {
			if (member_service.getMember(vo).getRole().equals("admin")) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}
}
