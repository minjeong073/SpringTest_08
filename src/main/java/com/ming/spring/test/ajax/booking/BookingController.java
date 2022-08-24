package com.ming.spring.test.ajax.booking;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.spring.test.ajax.booking.bo.BookingBO;
import com.ming.spring.test.ajax.booking.model.Booking;

@Controller
@RequestMapping("/ajax/booking")
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	// 메인 페이지
	@GetMapping("/main")
	public String main() {
		return "ajax/booking/bookingMain";
	}
	
	// 예약 목록 페이지
	@GetMapping("/list")
	public String list(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		return "ajax/booking/bookingList";
	}
	
	// 예약하기 페이지
	@GetMapping("/input")
	public String input() {
		return "ajax/booking/bookingInput";
	}
	
	// 예약 input 값 저장
	@PostMapping("/add")
	@ResponseBody
	public Map<String, Boolean> add(
			@RequestParam("name") String name
			, @RequestParam("date") String date
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Map<String, Boolean> map = new HashMap<>();
		// {"result", true} or {"result", false}
		map.put("result", bookingBO.addBooking(name, date, day, headcount, phoneNumber));
		
		return map;
	}
	
	// 삭제
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> delete(
			@RequestParam("clientId") int id) {
		
		Map<String, String> map = new HashMap<>();
		
		if (bookingBO.deleteBooking(id)) {
			map.put("result", "success");
		} else {
			map.put("result", "fail");
		}
		
		return map;	
	}
	
	
	// 조회
	@PostMapping("/search")
	@ResponseBody
	public Map<String, Object> search(Model model
			, @RequestParam("inputName") String name
			, @RequestParam("inputPhoneNumber") String phoneNumber) {
		
		Map<String, Object> map = bookingBO.searchBooking(name, phoneNumber);
		Map<String, Object> result = new HashMap<>();
		
		if (map.get("count").equals(1)) {
			result.put("result", true);
			result.put("data", map.get("booking"));
		} else {
			result.put("result", false);
			result.put("data", null);
		}
		
		return result;
	}

	// 객체 보내기
	// [] {}
	// {
	//	"name":"김민정",
	// 	"phoneNumber":"010-1111-1111",
	//	"date":"2022-01-01"
	//	}
	// return type 을 httpMassConv 가 확인해서 jackson 이 json 형태로 바꿔줌
	// postman 으로 json 데이터 확인하면서 코드 짜기
	
	// 만약 조회 실패해서 Booking 이 null 인 경우 비워진 json 으로 전달됨

	// ++
    // json 사용하는 이유 : 규격화된 데이터 사용하기 위함
    // {
    //		"result":"success"
    //		"data":{
	//			"name":"김민정",
	// 			"phoneNumber":"010-1111-1111",
	//			"date":"2022-01-01"
    //		}
    //	}
	// -> data 를 Map 형태로 전달
	// response 안에 data 안에 result, data 존재
	
	// 조회 다른 풀이
	@PostMapping("/find")
	@ResponseBody
	public Map<String, Object> find(
			@RequestParam("inputName") String name
			, @RequestParam("inputPhoneNumber") String phoneNumber) {
		Booking booking = bookingBO.findBooking(name, phoneNumber);

		// ++
		Map<String, Object> result = new HashMap<>();
		
		if (booking != null) {
			result.put("result", "success");
			result.put("data", booking);
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
}
