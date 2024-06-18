package com.example.demo.board;

import org.springframework.web.multipart.MultipartFile;

import io.micrometer.common.lang.NonNull;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class BoardVO {

	private int id;
	@NotBlank
	private String title;
	@NotBlank
	private String contents;

	private MultipartFile file;

	private String img;
	
	@Min(1)
	private int price;
}
