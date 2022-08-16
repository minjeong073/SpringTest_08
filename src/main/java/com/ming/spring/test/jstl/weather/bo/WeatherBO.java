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

	public int addWeatherByObject(Weather weather) {
		return weatherDAO.insertWeatherByObject(weather);
	}
}
