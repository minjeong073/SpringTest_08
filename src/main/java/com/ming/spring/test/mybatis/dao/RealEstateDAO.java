package com.ming.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.spring.test.mybatis.model.RealEstate;

@Repository
public interface RealEstateDAO {

	// 1. id 로 select
	public RealEstate selectRealEstate(@Param("id") int id);
	
	// 2. 월세 조건 select
	public List<RealEstate> selectRealEstateAsRent(@Param("rent") int rent);
	
	// 3. 복합 조건 select
	public List<RealEstate> selectMatchRealEstate(@Param("area") int area, @Param("price") int price);
	
	
	// insert
	// 1. 객체로 insert 하기
	public int insertRealEstateByObject(RealEstate realEstate);
	
}
