package com.ming.spring.test.database.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ming.spring.test.database.model.Store;

@Repository
public interface StoreDAO {

	// DAO : BO 에게 받은 요청 수행
	// mapper 에서 작성한 query(xml) 로 DB 가져옴
	
	public List<Store> selectStoreList();
}
