package com.wangsong;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;

@SpringCloudApplication
public class GatewayApplication {
	public static void main(String[] args) {
		new SpringApplicationBuilder(GatewayApplication.class).run(args);
	}
}
