package com.ming.spring.test.ajax.booking.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.ajax.booking.dao.BookingDAO;
import com.ming.spring.test.ajax.booking.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	// 예약 목록
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	// 삭제
	public boolean deleteBooking(int id) {
		return bookingDAO.deleteBooking(id) == 1;
	}
	
	// input 값 저장
	public boolean addBooking(String name, String date, int day, int headcount, String phoneNumber) {
		// 예약 상태는 사용자 입력이 아니기 때문에 BO 에서 넣어줌
		// 쿼리로 "대기중" 보다 안전
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, "대기중") == 1;	
	}
	
	// search	
	public Map<String, Object> searchBooking(String name, String phoneNumber) {
		Map<String, Object> map = new HashMap<>();
		// count : 조회 여부(1)
		// object : 조회된 정보(Booking)
		map.put("count", bookingDAO.selectCountSearchBooking(name, phoneNumber));
		map.put("booking", bookingDAO.selectSearchBooking(name, phoneNumber));
		
		return map;
	}
	
	// 조회 다른 풀이
	public Booking findBooking(String name, String phoneNumber) {
		return bookingDAO.selectFindBooking(name, phoneNumber);
	}
}
