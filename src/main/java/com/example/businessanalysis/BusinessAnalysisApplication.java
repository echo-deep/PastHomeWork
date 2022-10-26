package com.example.businessanalysis;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.businessanalysis.mapper")
public class BusinessAnalysisApplication {

    public static void main(String[] args) {
        SpringApplication.run(BusinessAnalysisApplication.class, args);
    }

}
