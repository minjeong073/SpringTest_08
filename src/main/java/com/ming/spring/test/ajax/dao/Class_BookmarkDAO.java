package com.ming.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.spring.test.ajax.model.Bookmark;

@Repository
public interface Class_BookmarkDAO {
	
	public List<Bookmark> selectBookmarkList();
	
	public int insertBookmark(
			@Param("name") String name
			, @Param("url") String url
			);
}
