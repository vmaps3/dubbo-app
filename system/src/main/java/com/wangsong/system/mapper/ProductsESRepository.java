package com.wangsong.system.mapper;

import com.wangsong.system.entity.ProductsES;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductsESRepository extends ElasticsearchRepository<ProductsES, String> {

}
