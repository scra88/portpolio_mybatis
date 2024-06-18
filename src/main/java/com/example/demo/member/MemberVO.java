package com.example.demo.member;


import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Data;

@Data
public class MemberVO {

	
	private int id;
	@NotBlank
	@Pattern(regexp = "^[a-zA-Z0-9]*$")
	private String name;
	@NotBlank
	@Pattern(regexp = "^[a-zA-Z0-9]*$")
	private String password;
	private String role;
	@Min(0)
	private int money;
}
