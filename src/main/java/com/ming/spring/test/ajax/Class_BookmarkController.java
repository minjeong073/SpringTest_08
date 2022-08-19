package com.ming.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.spring.test.ajax.bo.Class_BookmarkBO;
import com.ming.spring.test.ajax.model.Bookmark;

@Controller
@RequestMapping("/ajax/class/bookmark")
public class Class_BookmarkController {
	
	@Autowired
	private Class_BookmarkBO class_bookmarkBO;
	
	@GetMapping("/list")
	public String bookmarkList(Model model) {
		
		List<Bookmark> bookmarkList = class_bookmarkBO.getBookmarkList();
		
		model.addAttribute("bookmarkList", bookmarkList);
		
		return "ajax/class_bookmarkList";
	}
	
	@GetMapping("/input")
	public String bookmarkInput() {
		return "ajax/class_bookmarkInput";
	}
	
	@PostMapping("/add")
	@ResponseBody
	public Map<String, String> addBookmark(
			@RequestParam("name") String name
			, @RequestParam("url") String url
			) {
		int count = class_bookmarkBO.addBookmark(name, url);
		
		// insert 하고 나서 실행된 행의 개수로 성공 실패 여부 판단
		// json 형식으로 성공 실패 여부 데이터 만들어서 전송
		// @ResponseBody 로 return 된 data 를 httpMessageConverter 가 변환
		
		Map<String, String> map = new HashMap<>();
		
		// input 값이 하나이기 때문에 insert 실행된 행의 개수 = 1
		if (count == 1) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
				
		return map;
		// api 쓰는 사람은 insert 과정은 관계 없이 
		// result 값을 success, fail 둘 중 하나로 받아 판단만 함
		
	}
}
