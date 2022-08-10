package com.ming.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.spring.test.jsp.bo.SellerBO;
import com.ming.spring.test.jsp.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {

    @Autowired
    private SellerBO sellerBO;

    
    // 입력 form 을 이용해서 새로운 seller DB 추가
    @GetMapping("/input")
    public String sellerInput() {
        return "jsp/sellerInput";
    }

    
    // 입력 form 으로부터 데이터 가져오기
    @PostMapping("/add")
    @ResponseBody
    public String addSeller(
        @RequestParam("nickname") String nickname
        , @RequestParam("imageUrl") String imageUrl
        , @RequestParam("temperature") double temperature
    ) {

        int count = sellerBO.addSeller(nickname, imageUrl, temperature);
        return "입력 성공! 결과 : " + count;
    }

    
    // 가장 최근에 추가된 seller 정보 가져오기
    // ++ id 를 param 으로 받아서 해당하는 seller 정보 가져오기
    @RequestMapping("/info")
    public String sellerInfo(@RequestParam(value="id", required = false) Integer id
    		, Model model) {

    	// id 없으면 (= null 일 경우) 가장 최근에 추가된 seller 가져오기
    	// id 있으면 (= null 아닐 경우) 해당하는 seller 가져오기
    	Seller seller;

    	if (id == null) {
    		seller = sellerBO.getLastSeller();
    	} else {
    		seller = sellerBO.getSellerById(id);
    	}
    	
        model.addAttribute("title", "판매자 정보");
        model.addAttribute("seller", seller);
        return "jsp/sellerInfo";
    }
    

}
