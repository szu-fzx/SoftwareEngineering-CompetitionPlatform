package com.example.wuyou.model.dto;


import com.example.wuyou.model.entity.File;
import lombok.Data;
import java.io.Serializable;
import java.util.List;

@Data
public class ArticlesDTO implements Serializable {

    private Long userId; // 作者ID

    private String title; // 标题

    private String tags; // 所属栏目, 分类, 标签

    private String type; // 文章类型

    private List<File> imagesOrVideo; // 图片或者视频

    private Boolean isVideo;

    private String content; // 内容

    private Integer readCount; // 阅读数

    private Integer likeCount; // 点赞数

    private Integer favoriteCount; // 收藏数

    private Integer shareCount; // 分享数

    private Integer comments; // 评论数

    private Integer viewCount;
}
