package com.example.wuyou.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.wuyou.model.dto.ViewsCountDTO;
import com.example.wuyou.model.entity.Articles;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ArticlesMapper extends BaseMapper<Articles> {

    /**
     * 更新文章浏览量
     * @param viewsCountDTO
     */
    /*void updateArticleViewCount(ViewsCountDTO viewsCountDTO);*/
}
