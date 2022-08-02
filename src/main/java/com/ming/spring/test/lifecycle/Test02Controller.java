package com.ming.spring.test.lifecycle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ming.spring.test.lifecycle.model.Post;

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
	
	@RequestMapping("/2")
	public List<Post> jsonResponse2() {
		
		List<Post> list = new ArrayList<>();
		
		Post post;
		post = new Post()
		{{setTitle("안녕하세요 가입인사 드립니다");
		setUser("hagulu");
		setContent("안녕하세요 가입했어요. 앞으로 잘 부탁드립니다.");}};
		
		list.add(post);
				
		post = new Post()
		{{setTitle("헐 대박");
		setUser("bada");
		setContent("오늘 목요일이었어... 금요일인줄");};};
		
		list.add(post);
		
		post = new Post()
		{{setTitle("오늘 데이트 한 이야기 해드릴게요");
		setUser("dulumary");
		setContent("....");};};
		
		list.add(post);
		
		return list;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Post> responseEntity() {
		Post post = new Post()
		{{setTitle("안녕하세요 가입인사 드립니다");
		setUser("hagulu");
		setContent("안녕하세요 가입했어요. 앞으로 잘 부탁드립니다.");}};
		
		ResponseEntity<Post> entity = new ResponseEntity<>(post, HttpStatus.INTERNAL_SERVER_ERROR);
		return entity;
	}
	
	
	
}
