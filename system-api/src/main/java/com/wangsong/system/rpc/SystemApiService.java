package com.wangsong.system.rpc;



import com.wangsong.system.dto.ProductsDTO;

import java.math.BigDecimal;

public interface SystemApiService  {

    void updateById(ProductsDTO productsDTO);

    ProductsDTO getById(Long amount);
}
