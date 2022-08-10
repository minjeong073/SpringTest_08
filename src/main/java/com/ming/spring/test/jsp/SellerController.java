package com.ming.spring.test.jsp;

import com.ming.spring.test.jsp.bo.SellerBO;
import com.ming.spring.test.jsp.model.Seller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String addSeller(
        @RequestParam("nickname") String nickname
        , @RequestParam("imageUrl") String imageUrl
        , @RequestParam("temperature") double temperature
    ) {

        int count = sellerBO.addSeller(nickname, imageUrl, temperature);
        return "입력 성공! 결과 : " + count;
    }

    // 가장 최근에 추가된 seller 정보 가져오기
    @RequestMapping("/sellerInfo")
    public String sellerInfo(Model model) {
        Seller lastSeller = sellerBO.getLastSeller();
        model.addAttribute("title", "판매자 정보");
        model.addAttribute("seller", lastSeller);
        return "jsp/sellerInfo";
    }
}
