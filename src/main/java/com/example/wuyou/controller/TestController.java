package com.example.wuyou.controller;

import com.example.wuyou.common.BaseResponse;
import com.example.wuyou.common.ResultUtils;
import com.example.wuyou.utils.AliOssUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@Slf4j
@Api(tags = "测试接口")
@RequestMapping("/test")
@AllArgsConstructor
public class TestController {

    private final AliOssUtil aliOssUtil;

    @ApiOperation(value = "上传文件")
    @PostMapping("/upload")
    public BaseResponse upload(@RequestPart("file") MultipartFile file){
        log.info("上传文件：{}",file);
        try {
            String originalFilename =  file.getOriginalFilename();
            String filePath = aliOssUtil.upload(file.getBytes(),originalFilename);
            return ResultUtils.success(filePath);
        } catch (IOException e) {
            log.error("文件上传失败:{}",e);
        }
        return ResultUtils.error(401,"文件上传失败");
    }
}
