package com.example.wuyou.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("articles")
public class Articles implements Serializable {
    @TableId(type = IdType.AUTO)
    private Long id; // 主键ID

    private Long userId; // 作者ID

    private String title; // 标题

    private String tags; // 所属栏目, 分类, 标签

    private String type; // 文章类型

    private String imagesOrVideo; // 图片或者视频

    private Boolean isVideo;

    private String content; // 内容

    private Integer readCount; // 阅读数

    private Integer likeCount; // 点赞数

    @TableField(exist = false)
    private Boolean isLike;

    private Integer favoriteCount; // 收藏数

    @TableField(exist = false)
    private Boolean isFavorite;

    private Integer shareCount; // 分享数

    private Integer comments; // 评论数

    private Integer viewCount;

    private Date createdAt; // 创建时间

    private Date updatedAt; // 更新时间
}
