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
	public List<RealEstate> getRealEstateAsRent(int rent) {
		List<RealEstate> list = realEstateDAO.selectRealEstateAsRent(rent);
		return list;
	}
	
	// 3. 복합 조건 select
	public List<RealEstate> getMatchingRealEstate(int area, int price) {
		return realEstateDAO.selectMatchRealEstate(area, price);
	}
	
	// insert
	// 1. 객체로 insert 하기
	public int insertRealEstateByObject(RealEstate realEstate) {
		return realEstateDAO.insertRealEstateByObject(realEstate);
	}
	
	// 2. field 로 insert 하기
	public int insertRealEstate(int realtorId, String address, int area, String type, int price, int rentPrice) {
		return realEstateDAO.insertRealEstate(realtorId, address, area, type, price, rentPrice);
	}
}
