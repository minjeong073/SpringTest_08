package com.ming.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.ajax.dao.Class_BookmarkDAO;
import com.ming.spring.test.ajax.model.Bookmark;

@Service
public class Class_BookmarkBO {

	@Autowired
	private Class_BookmarkDAO class_bookmarkDAO;
	
	public List<Bookmark> getBookmarkList() {
		return class_bookmarkDAO.selectBookmarkList();
	}
	
	public int addBookmark(
			String name
			, String url
			) {
		
		return class_bookmarkDAO.insertBookmark(name, url);
	}
}
