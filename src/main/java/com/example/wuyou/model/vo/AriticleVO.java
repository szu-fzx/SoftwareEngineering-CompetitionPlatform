package com.example.wuyou.model.vo;

import com.example.wuyou.model.entity.File;
import com.example.wuyou.utils.DateUtil;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AriticleVO implements Serializable {
    private Long id; // 主键ID

    private String username = "AIBROAD官方";

    private String userImageUrl = "https://szu-fzx-ai-education.oss-cn-hangzhou.aliyuncs.com/pictures/1de9e58d-eba3-47c5-8b9f-2e9126170244.jpg";

    private String title; // 标题

    private String tags; // 所属栏目, 分类, 标签

    private String type; // 文章类型

    private List<File> imagesOrVideo; // 图片

    private Boolean isVideo;

    private String content; // 内容

    private Integer readCount; // 阅读数

    private Integer likeCount; // 点赞数

    private Boolean isLike;

    private Integer favoriteCount; // 收藏数

    private Boolean isFavorite;

    private Integer shareCount; // 分享数

    private Integer comments; // 评论数

    private Integer viewCount;

    @JsonFormat(pattern = DateUtil.DATE_TIME_PATTERN)
    private Date createdAt; // 创建时间
}
