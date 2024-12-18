package com.example.wuyou.controller;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.wuyou.common.BaseResponse;
import com.example.wuyou.common.ResultUtils;
import com.example.wuyou.model.dto.ArticlesDTO;
import com.example.wuyou.model.dto.PageQueryDTO;
import com.example.wuyou.model.entity.Articles;
import com.example.wuyou.model.vo.AriticleVO;
import com.example.wuyou.service.ArticlesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@Slf4j
@AllArgsConstructor
@RequestMapping("/community/imageAndVideo")
@Api(tags = "图文视频管理接口")
public class ImageVideoController {

    private final ArticlesService articlesService;

    /**
     * 图文分页查询
     * @param pageQueryDTO
     * @return
     */
    @PostMapping("/page")
    @ApiOperation(value = "图文视频分页查询")
    public BaseResponse<Page<AriticleVO>> page(@RequestBody PageQueryDTO pageQueryDTO){
        log.info("图文分页查询：{}",pageQueryDTO);
        int page = pageQueryDTO.getPage();
        int pageSize = pageQueryDTO.getPageSize();
        Page<Articles> articlesPage = articlesService.page(new Page<>(page, pageSize));
        return articlesService.page(pageQueryDTO);
    }

    /**
     * 根据id查询图文
     * @param id
     * @return
     */
    @GetMapping("/detail/{id}")
    @ApiOperation(value = "根据id查询图文视频")
    public BaseResponse<AriticleVO> getById(@PathVariable Long id){
        log.info("查询，图文id：{}",id);
        AriticleVO ariticleVO = articlesService.get(id);
        return ResultUtils.success(ariticleVO);
    }

    @PostMapping("/insert")
    @ApiOperation(value = "测试-插入图文视频接口")
    public BaseResponse<Boolean> insert(@RequestBody List<ArticlesDTO> articlesDTOList){
        List<Articles> list = new ArrayList<>();

        for (ArticlesDTO articlesDTO : articlesDTOList) {
            Articles articles = new Articles();
            BeanUtils.copyProperties(articlesDTO,articles,"images");
            articles.setImagesOrVideo(JSONUtil.toJsonStr(articlesDTO.getImagesOrVideo()));
            list.add(articles);
        }
        for (Articles articles : list) {
            articlesService.save(articles);
        }
        return ResultUtils.success(true);
    }

    /**
     * 点赞
     * @param id
     * @return
     */
    /*@ApiOperation(value = "点赞")
    @PutMapping("/isLike/{id}")
    public BaseResponse likeBlog(@PathVariable Long id){
        log.info("点赞，图文id：{}",id);
        return articlesService.likeBlog(id);
    }*/

    /**
     * 收藏
     * @param id
     * @return
     */
    /*@ApiOperation(value = "收藏")
    @PutMapping("/isFavorite/{id}")
    public BaseResponse favoriteBlog(@PathVariable Long id){
        log.info("收藏，图文id：{}",id);
        return articlesService.favoriteBlog(id);
    }*/

    /**
     * 分享
     * @param id
     * @return
     */
    /*@ApiOperation(value = "分享")
    @PutMapping("/share/{id}")
    public BaseResponse<Boolean> shareBlog(@PathVariable Long id){
        log.info("分享，图文id：{}",id);
        UpdateWrapper<Articles> wrapper = new UpdateWrapper<>();
        wrapper
                .setSql("share_count = share_count + 1")
                .eq("id",id);
        articlesService.update(wrapper);
        return ResultUtils.success(true);
    }*/
}
