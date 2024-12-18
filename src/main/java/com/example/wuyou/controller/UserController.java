package com.example.wuyou.controller;

import com.example.wuyou.common.ErrorCode;
import com.example.wuyou.common.PageRequest;
import com.example.wuyou.model.dto.*;
import com.example.wuyou.model.vo.UserInfoVo;
import com.example.wuyou.utils.AliOssUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.BeanUtils;
import com.example.wuyou.service.UserService;
import com.example.wuyou.model.entity.User;
import com.example.wuyou.common.BaseResponse;
import com.example.wuyou.common.ResultUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * 用户信息
 * @author : One Direction
 * @date : 2022-11-18
 */
@Api(tags = "用户账户管理")
@RestController
@RequestMapping("/user")
@Slf4j
public class UserController{
    @Autowired
    private UserService userService;

    @Autowired
    private AliOssUtil aliOssUtil;

    @ApiOperation(value = "上传简历")
    @GetMapping("/upload")
    public BaseResponse<String> uploadResume(@RequestPart("file") MultipartFile file) {
        log.info("上传简历：{}",file);
        try {
            String originalFilename =  file.getOriginalFilename();
            String filePath = aliOssUtil.upload(file.getBytes(),originalFilename);
            return ResultUtils.success(filePath);
        } catch (IOException e) {
            log.error("上传简历失败:{}",e);
        }
        return ResultUtils.error(ErrorCode.OPERATION_ERROR,"上传简历失败");
    }

    @ApiOperation(value = "删除简历")
    @GetMapping("/deleteResume")
    public BaseResponse<String> deleteResume(String fileName) {
        log.info("删除简历：{}",fileName);
        aliOssUtil.delete(fileName);
        return ResultUtils.success("删除简历成功");
    }

    @ApiOperation(value = "获取用户信息")
    @GetMapping("/getUserInfo")
    public BaseResponse<UserInfoVo> getUserInfo(HttpServletRequest request) {
        String token = request.getHeader("token");// 从 http 请求头中取出 token
        User result = userService.getUserInfo(token);
        UserInfoVo UserInfoVo = new UserInfoVo();
        BeanUtils.copyProperties(result, UserInfoVo);
        return ResultUtils.success(UserInfoVo);
    }

    @ApiOperation(value = "获取用户OpenId")
    @GetMapping("/getOpenId")
    public BaseResponse<GetOpenIdResponse> getOpenId(String codeId){
        GetOpenIdResponse result = userService.getOpenId(codeId);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "小程序授权登录")
    @PostMapping("/wxUserLogin")
    public BaseResponse<WxUserLoginResponse> wxUserLogin(@RequestBody WxUserLoginRequest wxUserLoginRequest){
        String openId = wxUserLoginRequest.getOpenid();
        String avatar = wxUserLoginRequest.getAvatar();
        String username = wxUserLoginRequest.getNickName();
        WxUserLoginResponse result = userService.wxUserLogin(openId,username,avatar);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "切换用户角色")
    @PostMapping("/switchRole")
    public BaseResponse<Boolean> switchRole(@RequestBody SwitchRoleRequest switchRoleRequest){
        String id = switchRoleRequest.getId();
        String role = switchRoleRequest.getRole();
        boolean result = userService.switchRole(id, role);
        return ResultUtils.success(result);
    }


    @ApiOperation(value = "账号密码登录")
    @PostMapping("/login")
    public BaseResponse<LoginResponse> login(@RequestBody LoginRequest LoginRequest){
        String username = LoginRequest.getUsername();
        String password = LoginRequest.getPassword();
        LoginResponse result = userService.login(username,password);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "获取用户列表")
    @PostMapping("/getUserList")
    public BaseResponse<PageListResponse<User>> getUserList(@RequestBody PageRequest params){
        long current = params.getCurrent();
        long pageSize = params.getPageSize();
        PageListResponse<User> result = userService.getUserList(current, pageSize);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "新增用户信息")
    @PostMapping("/addUser")
    public BaseResponse<Boolean> addUser(@RequestBody User params){
        Boolean result = userService.addUser(params);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "更新用户信息")
    @PostMapping("/updateUser")
    public BaseResponse<Boolean> updateUser(@RequestBody User params){
        Boolean result = userService.updateUser(params);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "删除用户信息")
    @DeleteMapping("/deleteUser/{id}")
    public BaseResponse<Boolean> deleteUser(@PathVariable("id") String id){
        Boolean result = userService.deleteUser(id);
        return ResultUtils.success(result);
    }


}
