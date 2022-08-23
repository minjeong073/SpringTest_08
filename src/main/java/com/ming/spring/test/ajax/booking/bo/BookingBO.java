package com.ming.spring.test.ajax.booking.bo;

import java.util.List;

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
	public boolean inputBooking(String name, String date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber) == 1;	
	}
	
	// search
	public boolean searchBooking(String name, String phoneNumber) {
		
	}
}
