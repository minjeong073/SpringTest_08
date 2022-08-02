package com.ming.spring.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/lifecycle/test02")
public class Test02Controller {

	@RequestMapping("/1")
	public List<Map<String, Object>> jsonResponse() {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		Map<String, Object> map;
		map = new HashMap<>()
		{{ put("rate", 15);
			put("director", "봉준호");
			put("time", 131);
			put("title", "기생충");}};

		list.add(map);
		
		map = new HashMap<>()
		{{ put("rate", 0);
			put("director", "로베르토 베니니");
			put("time", 116);
			put("title", "인생은 아름다워");}};

		list.add(map);
		
		map = new HashMap<>()
		{{ put("rate", 12);
			put("director", "크리스토퍼 놀란");
			put("time", 147);
			put("title", "인셉션");}};

		list.add(map);
		
		map = new HashMap<>()
		{{ put("rate", 19);
			put("director", "윤종빈");
			put("time", 133);
			put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");}};

		list.add(map);
		
		map = new HashMap<>()
		{{ put("rate", 15);
			put("director", "프란시스 로렌스");
			put("time", 137);
			put("title", "헝거게임");}};

		list.add(map);
		
		return list;
	}
	
}
