package com.ming.spring.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.ming.spring.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {

	// form 으로 입력받은 값 저장하기
	public int insertRealtor(Realtor realtor);
}
