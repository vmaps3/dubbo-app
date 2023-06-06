package com.wangsong.system.rpc;


import com.wangsong.system.dto.ProductsDTO;
import com.wangsong.system.entity.Products;
import com.wangsong.system.service.IProductsService;
import org.apache.dubbo.config.annotation.Service;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;

@Service
public class SystemApiServiceImpl implements SystemApiService {
    @Autowired
    private IProductsService productsService;

    @Override
    public void updateById(ProductsDTO productsDTO) {
        Products products = new Products();
        BeanUtils.copyProperties(productsDTO, products);
        productsService.updateById(products);
    }

    @Override
    public ProductsDTO getById(Long id) {
        com.wangsong.system.entity.Products byId = productsService.getById(id);
        ProductsDTO productsDTO = new ProductsDTO();
        BeanUtils.copyProperties(byId, productsDTO);
        return productsDTO;

    }

}
