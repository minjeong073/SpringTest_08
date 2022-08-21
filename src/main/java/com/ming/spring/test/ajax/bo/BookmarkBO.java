package com.ming.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.ajax.dao.BookmarkDAO;
import com.ming.spring.test.ajax.model.Bookmark;

@Service
public class BookmarkBO {
	
	@Autowired
	private BookmarkDAO bookmarkDAO;
	
	// 결과 페이지 Bookmark 정보 가져오기 
	public List<Bookmark> getBookmarkList() {
		return bookmarkDAO.selectBookmarkList();
	}
	
	// 입력 값 DB 저장하기
	public int addBookmark(String name, String url) {
		return bookmarkDAO.insertBookmark(name, url);
	}
	
	// url 중복 확인
	public boolean isDuplicate(String url) {
	
		// count = 0 인 경우 중복 없음 -> false	
		return bookmarkDAO.selectCountUrl(url) != 0;
	}
	
	// 삭제 기능
	public boolean removeBookmark(int id) {
		
		// delete 성공할 경우 1 
		return bookmarkDAO.deleteBookmark(id) == 1;
	}
	
}
