package com.ming.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.spring.test.jsp.bo.RealtorBO;
import com.ming.spring.test.jsp.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {

	@Autowired
	private RealtorBO realtorBO;
	
	
	// 1. input jsp 페이지 
	@GetMapping("/input")
	public String inputRealtor() {
		return "jsp/realtorInput";
	}
	
	
	// 2. form 으로 입력받은 값 저장 및 출력하기
	@GetMapping("/add")
	public String addRealtorView(
			@ModelAttribute Realtor realtor
			, Model model) {
		
		int count = realtorBO.addRealtorByObject(realtor);
		model.addAttribute("realtor", realtor);
		
		return "jsp/realtorInfo";
	}
	
}
