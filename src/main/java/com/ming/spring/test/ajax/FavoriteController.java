package com.ming.spring.test.ajax;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FavoriteController {

	// 결과 페이지
	@RequestMapping("/ajax/favorite/list")
	public String list() {
		return "ajax/favoriteList";
	}
	

}
