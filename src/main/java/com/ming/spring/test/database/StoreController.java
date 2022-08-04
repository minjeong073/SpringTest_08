package com.ming.spring.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.spring.test.database.bo.StoreBO;
import com.ming.spring.test.database.model.Store;

@Controller
public class StoreController {
	
	// controller : req 받아서 resp 생성
	// 필요한 DB 를 BO 에게 요청(역할 넘김)
	
	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/database/test01")
	@ResponseBody
	public List<Store> test01() {
		
		List<Store> storeList = storeBO.getStoreList();
		return storeList;
	}
}
