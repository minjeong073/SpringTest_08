package com.ming.spring.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.spring.test.jsp.dao.SellerDAO;
import com.ming.spring.test.jsp.model.Seller;

@Service
public class SellerBO {

    @Autowired
    private SellerDAO sellerDAO;

    // form 입력 데이터 저장
    public int addSeller(String nickname, String imageUrl, double temperature) {
        return sellerDAO.insertSeller(nickname, imageUrl, temperature);
    }

    // 가장 최근에 추가된 seller 정보 가져오기
    public Seller getLastSeller() {
        return sellerDAO.selectLastSeller();
    }

    // id 로 seller 정보 가져오기
    public Seller getSellerById(int id) {
        return sellerDAO.selectSellerById(id);
    }

}
