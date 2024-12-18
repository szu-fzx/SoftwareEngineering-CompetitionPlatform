package com.example.wuyou.service;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.wuyou.common.BaseResponse;
import com.example.wuyou.common.ResultUtils;
import com.example.wuyou.model.dto.PageQueryDTO;
import com.example.wuyou.model.dto.ViewsCountDTO;
import com.example.wuyou.model.entity.Articles;
import com.example.wuyou.model.vo.AriticleVO;

public interface ArticlesService extends IService<Articles> {

    /**
     * 分页查询图文视频
     * @param pageQueryDTO
     * @return
     */
    BaseResponse<Page<AriticleVO>> page(PageQueryDTO pageQueryDTO);

    /**
     * 获取图文视频
     * @param id
     * @return
     */
    AriticleVO get(Long id);

    /**
     * 点赞
     * @param id
     * @return
     */
    //BaseResponse likeBlog(Long id);

    /**
     * 收藏
     * @param id
     * @return
     */
    //BaseResponse favoriteBlog(Long id);

    //void updateArticleViewCount(ViewsCountDTO viewsCountDTO);
}
