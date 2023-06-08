package com.wangsong.order.controller;


import com.wangsong.user.rpc.UserApiService;
import org.apache.dubbo.config.annotation.Reference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@RestController
@RequestMapping("/order")
public class OrderController {

    @Reference(check = false)
    private UserApiService userApiService;


    //http://127.0.0.1:1101/order/order/rpc?string=11
    @GetMapping(value = "/rpc")
    public String getSemaphore(String string) {
        return userApiService.rpc(string);
    }


}
