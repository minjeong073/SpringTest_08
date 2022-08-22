package com.ming.spring.test.ajax.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	@GetMapping("/booking")
	public String booking() {
		return "ajax/booking/booking";
	}
	
	

}
