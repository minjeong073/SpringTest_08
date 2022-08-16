package com.ming.spring.test.jstl.weather.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ming.spring.test.jstl.weather.model.Weather;

@Repository
public interface WeatherDAO {

	// weather 정보 select
	public List<Weather> selectWeatherList();
}
