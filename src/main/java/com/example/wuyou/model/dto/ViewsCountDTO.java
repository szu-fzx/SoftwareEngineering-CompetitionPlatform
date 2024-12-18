package com.example.wuyou.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ViewsCountDTO {

    private Integer articleId;

    private Integer viewCount;
}
