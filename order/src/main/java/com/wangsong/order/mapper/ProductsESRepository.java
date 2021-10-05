package com.wangsong.order.mapper;

import com.wangsong.order.entity.ProductsES;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductsESRepository extends ElasticsearchRepository<ProductsES, String> {

}
