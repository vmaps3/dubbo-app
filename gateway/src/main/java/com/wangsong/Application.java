package com.wangsong;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;

@SpringCloudApplication
public class Application {
	public static void main(String[] args) {
		new SpringApplicationBuilder(Application.class).run(args);
	}
}
