package com.wangsong.user.controller;


import com.wangsong.user.service.IProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@RestController
@RequestMapping("/products")
public class ProductsController {
    @Autowired
    private IProductsService productsService;

    //http://127.0.0.1:1101/user/products/getSemaphore
    @GetMapping(value = "/getSemaphore")
    public String getSemaphore() {
        return productsService.getSemaphore();
    }

    //http://127.0.0.1:1101/user/products/semaphore?uuid=
    @GetMapping(value = "/semaphore")
    public void semaphore(String uuid) {
        productsService.semaphore(uuid);

    }

    //http://127.0.0.1:1101/user/products/productsCache
    @GetMapping(value = "/productsCache")
    public Object productsCache() {
        return productsService.productsCache();
    }

    //http://127.0.0.1:1101/user/products/productsCacheDelete
    @GetMapping(value = "/productsCacheDelete")
    public void productsCacheDelete() {
        productsService.productsCacheDelete();
    }

    //http://127.0.0.1:1101/user/products/productsStock?integer=5
    @GetMapping(value = "/productsStock")
    public void productsStock(Integer integer) {
        productsService.productsStock(integer);
    }

    //http://127.0.0.1:1101/user/products/productsStockDecrement
    @GetMapping(value = "/productsStockDecrement")
    public Long productsStockDecrement() {
        return productsService.productsStockDecrement();
    }

    //http://127.0.0.1:1101/user/products/productsStockIncrement
    @GetMapping(value = "/productsStockIncrement")
    public Long productsStockIncrement() {
        return productsService.productsStockIncrement();
    }
    //http://127.0.0.1:1101/user/products/toMQ?string=111
    @GetMapping(value = "/toMQ")
    public void toMQ(String string) {
        productsService.toMQ(string);
    }


}
