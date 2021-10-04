package com.wangsong.order.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

import java.io.Serializable;

@Data
@Document(indexName = "products")
public class ProductsES implements Serializable {

    @Id
    private String id;

    private String name;


}
