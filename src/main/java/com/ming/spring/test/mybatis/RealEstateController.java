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
@RequestMapping("/mybatis/test")
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1. id 로 select
	@RequestMapping("/select/1")
	@ResponseBody
	public RealEstate realEstate(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateBO.getRealEstate(id);
		return realEstate;		
	}
	
	// 2. 월세 조건 select
	@RequestMapping("/select/2")
	@ResponseBody
	public List<RealEstate> realEstateAsRent(@RequestParam("rent") int rent) {
		List<RealEstate> list = realEstateBO.getRealEstateAsRent(rent);
		return list;
	}
	
	// 3. 복합 조건 select
	@RequestMapping("/select/3")
	@ResponseBody
	public List<RealEstate> matchRealEstates(@RequestParam("area") int area, @RequestParam("price") int price) {
		List<RealEstate> list = realEstateBO.getMatchingRealEstate(area, price);
		return list;
	}
	
	
	// insert
	// 1. 객체로 insert 하기
	@RequestMapping("/insert/1")
	@ResponseBody
	public String insertRealEstateByObject() {
		
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateBO.insertRealEstateByObject(realEstate);
		
		return "입력 성공 : " + count;
		
	}
	
	// 2. field 로 insert 하기
	@RequestMapping("/insert/2")
	@ResponseBody
	public String insertRealEstate(@RequestParam("realtorId") int realtorId) {
		int count = realEstateBO.insertRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력 성공 : " + count;
	}
	
	// update
	@RequestMapping("/update")
	@ResponseBody
	public String updateRealEstate() {
		int count = realEstateBO.updateRealEstate(26, "전세", 70000);
		
		return "수정 성공 : " + count;
	}
	
	// delete
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteRealEstate(@RequestParam("id") int id) {
		int count = realEstateBO.deleteRealEstate(id);
		
		return "삭제 성공 : " + count;
	}
}
