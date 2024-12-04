package com.example.wuyou.controller;

import com.example.wuyou.common.BaseResponse;
import com.example.wuyou.common.PageRequest;
import com.example.wuyou.common.ResultUtils;
import com.example.wuyou.model.dto.GetCompanyJobRequest;
import com.example.wuyou.model.dto.PageListResponse;
import com.example.wuyou.model.entity.Company;
import com.example.wuyou.model.vo.CompanyInfoVo;
import com.example.wuyou.model.vo.JobInfoVo;
import com.example.wuyou.service.CompanyService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


/**
 * 公司信息;
 * @author : One Direction
 * @date : 2022-11-18
 */
@Api(tags = "公司信息管理")
@RestController
@RequestMapping("/company")
public class CompanyController {
    @Autowired
    private CompanyService companyService;

    @ApiOperation(value = "获取公司列表")
    @PostMapping("/getCompanyList")
    public BaseResponse<PageListResponse<CompanyInfoVo>> getCompanyList(@RequestBody PageRequest params){
        long current = params.getCurrent();
        long pageSize = params.getPageSize();
        PageListResponse<CompanyInfoVo> result = companyService.getCompanyList(current, pageSize);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "获取公司职位")
    @PostMapping("/getCompanyJob")
    public BaseResponse<PageListResponse<JobInfoVo>> getCompanyJob(@RequestBody GetCompanyJobRequest params){
        String id =  params.getId();
        long current = params.getCurrent();
        long pageSize = params.getPageSize();
        PageListResponse<JobInfoVo> result = companyService.getCompanyJob(id,current, pageSize);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "获取公司信息")
    @GetMapping("/getCompanyInfo/{id}")
    public BaseResponse<CompanyInfoVo> getCompanyInfo(@PathVariable("id") String id){
        CompanyInfoVo result = companyService.getCompanyInfo(id);
        return ResultUtils.success(result);
    }

    // 管理员新增公司信息
    @ApiOperation(value = "新增公司信息")
    @PostMapping("/addCompanyInfo")
    public BaseResponse<Boolean> addCompanyInfo(@RequestBody Company params){
        Boolean result = companyService.addCompanyInfo(params);
        return ResultUtils.success(result);
    }

    // 删除公司信息
    @ApiOperation(value = "删除公司信息")
    @DeleteMapping("/deleteCompany/{id}")
    public BaseResponse<Boolean> deleteCompany(@PathVariable("id") String id){
        Boolean result = companyService.deleteCompany(id);
        return ResultUtils.success(result);
    }

    @ApiOperation(value = "更新公司信息")
    @PostMapping("/updateCompanyInfo")
    public BaseResponse<Boolean> updateCompanyInfo(@RequestBody Company params){
        Boolean result = companyService.updateCompanyInfo(params);
        return ResultUtils.success(result);
    }

    // 招聘者新增公司信息
    @ApiOperation(value = "新增公司信息")
    @PostMapping("/addCompany")
    public BaseResponse<Boolean> addCompany(@RequestBody Company params, HttpServletRequest request){
        String token = request.getHeader("token");
        Boolean result = companyService.addCompany(params,token);
        return ResultUtils.success(result);
    }

}
