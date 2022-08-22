package com.ming.spring.test.ajax.booking.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ming.spring.test.ajax.booking.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
}
