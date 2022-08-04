package com.ming.spring.test.database.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.database.dao.StoreDAO;
import com.ming.spring.test.database.model.Store;

@Service
public class StoreBO {

	// BO : controller 에게 받은 요청 수행
	// - DAO 에 DB 요청
	
	@Autowired
	private StoreDAO storeDAO;
	
	public List<Store> getStoreList() {
		
		List<Store> storeList = storeDAO.selectStoreList();
		return storeList;
	}
	
}
