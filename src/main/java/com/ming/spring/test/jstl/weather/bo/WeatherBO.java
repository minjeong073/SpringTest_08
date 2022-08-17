package com.ming.spring.test.jstl.weather.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.jstl.weather.dao.WeatherDAO;
import com.ming.spring.test.jstl.weather.model.Weather;

@Service
public class WeatherBO {

	@Autowired
	private WeatherDAO weatherDAO;
	
	// weather 정보 가져오기
	public List<Weather> getWeatherList() {
		return weatherDAO.selectWeatherList();
	}

	// 입력받은 weather 정보 입력하기
	public int addWeatherByObject(Weather weather) {
		return weatherDAO.insertWeatherByObject(weather);
	}
	
	// 수업 문제 풀이
	public int addWeather2(
			String date
			, String weather
			, double temperatures
			, double precipitation
			, String microDust
			, double windSpeed) {
		
		return weatherDAO.insertWeather2(date, weather, temperatures, precipitation, microDust, windSpeed);
		
	}
	
}
