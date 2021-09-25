package com.wangsong.order.vo;

import com.wangsong.common.model.Page;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductsPage extends Page implements Serializable {
    private String name;
}