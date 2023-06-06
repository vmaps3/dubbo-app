# dubbo-app

## 业务功能

- 发布商品，异步rabbitmq写入es
- 防重提交 redisson信号量
- 购买 异步rabbitmq
- 购买后支付超时还原库存 rabbitmq延迟队列

## 技术栈

- dubbo
- nacos
- gateway
- springboot
- mybatispuls
- rabbitmq
- es
- redis

## 部署

- 导入数据库脚本sql下sql文件
- 启动nacos
- 启动rabbitmq
- 启动redis
- 启动elasticsearch
- 启动canal
- 启动system
- 启动order
- 启动gateway
- 

## 使用

- 发布商品127.0.0.1:1101/system/products/add?name=商品名称&stock=库存0&amount=金额
- 商品列表http://127.0.0.1:1101/system/products/list?name=商品名称
- 购买信号量http://127.0.0.1:1101/order/order/getSemaphore
- 购买http://127.0.0.1:1101/order/order/pay?id=商品id&userId=1&uuid=信号量
- 支付回调http://127.0.0.1:1101/order/order/callback?id=订单号
