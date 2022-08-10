package com.ming.spring.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.spring.test.jsp.model.Seller;

@Repository
public interface SellerDAO {

    // form 입력 데이터 query 로 insert
    public int insertSeller(
        @Param("nickname") String nickname
        , @Param("imageUrl") String imageUrl
        , @Param("temperature") double temperature);


    // 가장 최근에 추가된 seller 정보 query 로 select
    public Seller selectLastSeller();

    // id 로 seller 정보 가져오기
    public Seller selectSellerById(@Param("id") int id);

}
