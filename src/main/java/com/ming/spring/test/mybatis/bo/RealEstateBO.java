package com.ming.spring.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.mybatis.dao.RealEstateDAO;
import com.ming.spring.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	// 1. id 로 select
	public RealEstate getRealEstate(int id) {
		RealEstate realEstate = realEstateDAO.selectRealEstate(id);
		return realEstate;
	}
	
	// 2. 월세 조건 select
	public List<RealEstate> getRentPrice(int rent) {
		List<RealEstate> list = realEstateDAO.selectRentPrice(rent);
		return list;
	}
	
	// 3. 복합 조건 select
	public List<RealEstate> getMatchingRealEstate(int area, int price) {
		List<RealEstate> list = realEstateDAO.selectMatchRealEstate(area, price);
		return list;
	}
}
