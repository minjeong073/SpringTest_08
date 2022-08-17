package com.ming.spring.test.jstl.weather;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.spring.test.jstl.weather.bo.WeatherBO;
import com.ming.spring.test.jstl.weather.model.Weather;

@Controller
@RequestMapping("/jstl/weather")
public class WeatherController {

	@Autowired
	private WeatherBO weatherBO;
	
	// jsp 화면
	@GetMapping("/info")
	public String weatherHistoryInfo(Model model) {
		
		List<Weather> weatherList = weatherBO.getWeatherList();
		
		model.addAttribute("weatherList", weatherList);
		
		return "jstl/weather/info";
	}
	
	
	// form 입력 받기
	@GetMapping("/input")
	public String weatherInput() {
		return "jstl/weather/input";
	}
	
	
	// 입력 받은 값 DB에 저장하기
	@PostMapping("/add")
	public String addWeather(
			@ModelAttribute Weather weather
			, Model model) {
		
		weatherBO.addWeatherByObject(weather);
		
		model.addAttribute("weather", weather);
		
		// info 화면으로 redirect
		return "redirect:/jstl/weather/info";
	}
	
	// 수업 문제 풀이
	@GetMapping("/add2")
	@ResponseBody
	public String addWeather2(
			@RequestParam("date") String date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed) {
		
		int count = weatherBO.addWeather2(date, weather, temperatures, precipitation, microDust, windSpeed);
		
		return "삽입 결과 : " + count;
				
	}
}
