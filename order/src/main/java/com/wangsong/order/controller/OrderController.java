package com.wangsong.order.controller;


import com.wangsong.common.model.CodeEnum;
import com.wangsong.common.model.GetEasyUIData;
import com.wangsong.common.model.Page;
import com.wangsong.common.model.Result;
import com.wangsong.order.entity.Products;
import com.wangsong.order.service.IOrderService;
import com.wangsong.order.service.impl.OrderServiceImpl;
import com.wangsong.order.vo.ProductsPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import com.wangsong.common.controller.BaseController;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author jobob
 * @since 2021-09-25
 */
@RestController
@RequestMapping("/order/order")
public class OrderController extends BaseController {
    @Autowired
    private IOrderService orderService;



    @PostMapping(value = "/pay")
    public Result update(Long id) {
        String userDetails = (String) SecurityContextHolder.getContext()
                .getAuthentication()
                .getPrincipal();
        orderService.send(id, userDetails);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }

    @GetMapping(value = "/list")
    public Result list(Page page) {
        GetEasyUIData list = orderService.lists(page);
        return new Result(CodeEnum.SUCCESS.getCode(), list);
    }

    @PostMapping(value = "/callback")
    public Result callback(Long id) {
        orderService.callback(id);
        return new Result(CodeEnum.SUCCESS.getCode(), null);
    }
}
