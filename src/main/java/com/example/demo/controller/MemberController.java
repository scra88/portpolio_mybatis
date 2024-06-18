package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.member.MemberServiceImpl;
import com.example.demo.member.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MemberController {

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	@Autowired
	MemberServiceImpl service;

	@Autowired
	PasswordEncoder passwordEncoder; // DI

	@GetMapping("RegisterForm.do")
	String RegisterForm() {

		return "RegisterForm";
	}

	@GetMapping("register_fail.do")
	String RegisterFail() {
		return "register_fail";
	}

	@GetMapping("LoginForm.do")
	String LoginForm() {
		if (session.getAttribute("login_id") != null) {
			return "redirect:index.do";
		} else {
			return "LoginForm";
		}
	}

	@GetMapping("Login_fail.do")
	String Login_fail() {
		return "login_fail";
	}

	@GetMapping("Register_success.do")
	String Register_success() {
		return "register_success";
	}

	@PostMapping("LoginOk.do")
	String LoginOk(MemberVO vo) {
		if (service.getMember(vo) == null) {
			return "redirect:Login_fail.do";
		} else {
			String password = service.getMember(vo).getPassword();
			if (passwordEncoder.matches(vo.getPassword(), password)) {
				session.setAttribute("login_id", vo.getName());
				return "redirect:index.do";
			} else {
				return "redirect:Login_fail.do";
			}
		}
	}

	@GetMapping("LogOut.do")
	String Logout() {
		session.removeAttribute("login_id");

		return "redirect:index.do";
	}

	@PostMapping("RegisterOk.do")
	String RegisterOk(@Valid MemberVO vo) {
		String password = passwordEncoder.encode(vo.getPassword());
		vo.setPassword(password);
		if (service.getMember(vo) == null) {
			service.RegisterOk(vo);
			return "redirect:Register_success.do";
		} else {

			return "redirect:register_fail.do";
		}
	}
}
