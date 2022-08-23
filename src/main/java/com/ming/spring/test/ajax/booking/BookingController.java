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
			result.put("booking", map.get("booking"));
		} else {
			result.put("result", false);
			result.put("booking", map.get("booking"));
		}
		
		return result;
	}

}
