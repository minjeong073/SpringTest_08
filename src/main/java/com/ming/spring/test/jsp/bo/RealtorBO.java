package com.ming.spring.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.jsp.dao.RealtorDAO;
import com.ming.spring.test.jsp.model.Realtor;

@Service
public class RealtorBO {
	
	@Autowired
	private RealtorDAO realtorDAO;

	// form 으로 입력받은 값 저장하기
	public int addRealtorByObject(Realtor realtor) {
		return realtorDAO.insertRealtor(realtor);
	}
}
