package com.ming.spring.test.ajax.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.spring.test.ajax.model.Bookmark;

@Repository
public interface BookmarkDAO {

	// Bookmark 데이터 select
	public List<Bookmark> selectBookmarkList();
	
	// 입력 값 insert
	public int insertBookmark(
			@Param("name") String name
			, @Param("url") String url);
	
	// url 중복 확인
	public int selectCountUrl(@Param("url") String url);
	
	// 삭제 기능
	public int deleteBookmark(@Param("id") int id);
	
}
