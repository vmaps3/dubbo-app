package com.wangsong.system.rpc;



import com.wangsong.system.dto.ProductsDTO;

public interface SystemApiService  {

    void updateById(ProductsDTO productsDTO);

    ProductsDTO getById(Long amount);

    Long productsStockDecrement(Long id);

    Long productsStockAdd(Long id);
}
