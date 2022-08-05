package com.ming.spring.test.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.spring.test.mybatis.bo.RealEstateBO;
import com.ming.spring.test.mybatis.model.RealEstate;

@Controller
@RequestMapping("/mybatis/test01")
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1. id 로 select
	@RequestMapping("/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		return realEstate;		
	}
	
	// 2. 월세 조건 select
	@RequestMapping("/2")
	@ResponseBody
	public List<RealEstate> realEstateAsRent(@RequestParam("rent") int rent) {
		List<RealEstate> list = realEstateBO.getRealEstateAsRent(rent);
		return list;
	}
	
	// 3. 복합 조건 select
	@RequestMapping("/3")
	@ResponseBody
	public List<RealEstate> matchRealEstates(@RequestParam("area") int area, @RequestParam("price") int price) {
		List<RealEstate> list = realEstateBO.getMatchingRealEstate(area, price);
		return list;
	}
	
	
	// insert
	// 1. 객체로 insert 하기
	@RequestMapping("/insert/1")
	public int insertRealEstateByObject() {
		RealEstate realEstate = new RealEstate();
		
		
		
	}
}
