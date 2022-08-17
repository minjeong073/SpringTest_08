package com.ming.spring.test.jstl.weather.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.spring.test.jstl.weather.model.Weather;

@Repository
public interface WeatherDAO {

	// weather 정보 select
	public List<Weather> selectWeatherList();

	// weather 입력 정보 insert
	public int insertWeatherByObject(Weather weather);
	
	// 수업 문제 풀이 
	public int insertWeather2(
			@Param("date") String date
			, @Param("weather") String weather
			, @Param("temperatures") double temperatures
			, @Param("precipitation") double precipitation
			, @Param("microDust") String microDust
			, @Param("windSpeed") double windSpeed);
}
