package com.ming.spring.test.jstl.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JstlStoreController {

	@GetMapping("/jstl/store/info")
	public String info() {
		return "jstl/store/storeInfo";
	}
}
