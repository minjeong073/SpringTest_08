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

import com.ming.spring.test.ajax.bo.BookmarkBO;
import com.ming.spring.test.ajax.model.Bookmark;

@Controller
@RequestMapping("/ajax/bookmark")
public class BookmarkController {

	@Autowired
	private BookmarkBO bookmarkBO;
	
	// 결과 페이지
	@GetMapping("/list")
	public String list(Model model) {
		
		List<Bookmark> bookmarkList = bookmarkBO.getBookmarkList();
		
		model.addAttribute("bookmarkList", bookmarkList);
		
		return "ajax/bookmarkList";
	}
	
	
	// 입력 페이지
	@GetMapping("/input")
	public String input() {
		
		return "ajax/bookmarkInput";
	}
	
	
	// 입력 값 DB 저장
	@GetMapping("/add")
	@ResponseBody
	public Map<String, String> add(
			@RequestParam("name") String name
			, @RequestParam("url") String url
			) {
		
		
		// ajax -> return type = json
		int count = bookmarkBO.addBookmark(name, url);
		
		Map<String, String> map = new HashMap<>();
		
		if (count == 1) {
			map.put("result", "success");		
		} else {
			map.put("result", "fail");
		}
		
		
		// return "redirect:/ajax/bookmark/list";
		return map;
	}
	
	
	// url 중복 확인
	@PostMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean> isDuplicate(
			@RequestParam("url") String url) {
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("is_duplicate", bookmarkBO.isDuplicate(url));
		
		return map;
	}
	
	// 삭제 기능
	@GetMapping("/remove")
	@ResponseBody
	public Map<String, Boolean> removeBookmark(
			@RequestParam("id") int id) {
		
		Map<String, Boolean> map = new HashMap<>();
		
		map.put("result", bookmarkBO.removeBookmark(id));
		
		return map;
	}

}
