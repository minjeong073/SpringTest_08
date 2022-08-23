package com.ming.spring.test.ajax.booking.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.spring.test.ajax.booking.model.Booking;

@Repository
public interface BookingDAO {

	// 예약 목록
	public List<Booking> selectBookingList();
	
	// 삭제
	public int deleteBooking(int id);
	
	// 입력 값 저장
	public int insertBooking(
			@Param("name") String name
			, @Param("date") String date
			, @Param("day") int day
			, @Param("headcount") int headcount
			, @Param("phoneNumber") String phoneNumber);
}
