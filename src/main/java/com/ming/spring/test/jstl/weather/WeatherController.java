package com.ming.spring.test.jstl.weather;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		return "jstl/weatherInfo";
	}
	
	
	// form 입력 받기
	@GetMapping("/input")
	public String weatherInput() {
		return "jstl/weatherInput";
	}
	
	// 입력 받은 값 DB에 저장하기
	@PostMapping("/add")
	public String addWeather(
			@ModelAttribute Weather weather
			, Model model) {
		
		weatherBO.addWeatherByObject(weather);
		
		model.addAttribute("weather", weather);
		
		return "redirect:jstl/weatherInfo";
	}
}
