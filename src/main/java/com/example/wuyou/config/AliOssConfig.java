package com.example.wuyou.config;


import com.example.wuyou.constant.AliOssConstant;
import com.example.wuyou.utils.AliOssUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@Slf4j
public class AliOssConfig {

    @Bean//交给ioc容器管理
    @ConditionalOnMissingBean//工具类，创建一个对象就好了
    public AliOssUtil ossClient(AliOssConstant aliOssConstant) {
        log.info("开始创建阿里云文件上传工具类对象:{}", aliOssConstant);
        return new AliOssUtil(
                aliOssConstant.getEndpoint(),
                aliOssConstant.getAccessKeyId(),
                aliOssConstant.getAccessKeySecret(),
                aliOssConstant.getBucketName()
        );
    }
}
