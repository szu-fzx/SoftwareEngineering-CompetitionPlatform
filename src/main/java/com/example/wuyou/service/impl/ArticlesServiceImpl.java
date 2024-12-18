package com.example.wuyou.service.impl;


import cn.hutool.core.util.BooleanUtil;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.wuyou.common.BaseResponse;
import com.example.wuyou.common.ResultUtils;
import com.example.wuyou.mapper.ArticlesMapper;
import com.example.wuyou.model.dto.PageQueryDTO;
import com.example.wuyou.model.dto.ViewsCountDTO;
import com.example.wuyou.model.entity.Articles;
import com.example.wuyou.model.entity.File;
import com.example.wuyou.model.vo.AriticleVO;
import com.example.wuyou.service.ArticlesService;
import com.example.wuyou.utils.RedisCache;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static com.example.wuyou.constant.ViewsCountConstant.ARTICLE_VIEWCOUNT_CODE;
import static com.example.wuyou.constant.ViewsCountConstant.ARTICLE_VIEWCOUNT_KEY;
import static com.example.wuyou.utils.RedisCache.NOT_EXPIRE;

@Service
@AllArgsConstructor
public class ArticlesServiceImpl extends ServiceImpl<BaseMapper<Articles>,Articles> implements ArticlesService {

    private final ArticlesMapper articlesMapper;

    private final StringRedisTemplate stringRedisTemplate;

    private final RedisCache redisCache;

    //private final MyCollectionsMapper myCollectionsMapper;

    /**
     * 图文分页查询
     * @param pageQueryDTO
     * @return
     */
    @Override
    public BaseResponse<Page<AriticleVO>> page(PageQueryDTO pageQueryDTO) {
        int page = pageQueryDTO.getPage();
        int pageSize = pageQueryDTO.getPageSize();
        //分页查询
        Page<Articles> articlesPage = page(new Page<>(page, pageSize));
        List<Articles> articlesPageRecords = articlesPage.getRecords();
        //封装
        List<AriticleVO> ariticleVOList = new ArrayList<>();

        for (Articles articlesPageRecord : articlesPageRecords) {
            AriticleVO ariticleVO = new AriticleVO();
            BeanUtils.copyProperties(articlesPageRecord,ariticleVO,"images");
            ariticleVO.setImagesOrVideo(JSONUtil.toList(articlesPageRecord.getImagesOrVideo(), File.class));
            /*isBlogLiked(ariticleVO);
            isBlogFavorited(ariticleVO);*/
            ariticleVOList.add(ariticleVO);
        }
        Page<AriticleVO> ariticleVOPage = new Page<>();
        ariticleVOPage.setRecords(ariticleVOList);
        return ResultUtils.success(ariticleVOPage);
    }

    /**
     * 根据id查询图文
     * @param id
     * @return
     */
    @Override
    public AriticleVO get(Long id) {
        String key = ARTICLE_VIEWCOUNT_CODE + id;
        Map<String, Object> viewCountItem = redisCache.hGetAll(ARTICLE_VIEWCOUNT_KEY);
        if(!viewCountItem.isEmpty()){
            if(viewCountItem.containsKey(key)){
                Integer viewCount = (Integer)viewCountItem.get(key);
                redisCache.hSet(ARTICLE_VIEWCOUNT_KEY,key,viewCount+1,NOT_EXPIRE);
            }else {
                redisCache.hSet(ARTICLE_VIEWCOUNT_KEY,key,1,NOT_EXPIRE);
            }
        }else{
            redisCache.hSet(ARTICLE_VIEWCOUNT_KEY,key,1,NOT_EXPIRE);
        }
        Articles articles = articlesMapper.selectById(id);
        AriticleVO ariticleVO = new AriticleVO();
        BeanUtils.copyProperties(articles,ariticleVO,"imagesOrVideo");
        ariticleVO.setImagesOrVideo(JSONUtil.toList(articles.getImagesOrVideo(),File.class));
        /*isBlogLiked(ariticleVO);
        isBlogFavorited(ariticleVO);*/
        return ariticleVO;
    }

    /*private void isBlogLiked(AriticleVO ariticleVO){
        Long userId = SecurityUser.getUserId();
        //判断当前登录用户是否点赞
        String key = "imageText:like:"+ariticleVO.getId();
        Boolean isMember =  stringRedisTemplate.opsForSet().isMember(key,userId.toString());
        ariticleVO.setIsLike(BooleanUtil.isTrue(isMember));
    }*/

    /*private void isBlogFavorited(AriticleVO ariticleVO){
        Long userId = SecurityUser.getUserId();
        //判断当前登录用户是否收藏
        String key = "imageText:favorite:"+ariticleVO.getId();
        Boolean isMember =  stringRedisTemplate.opsForSet().isMember(key,userId.toString());
        ariticleVO.setIsFavorite(BooleanUtil.isTrue(isMember));
    }*/

    /**
     * 点赞
     * @param id
     * @return
     */
    /*@Override
    public BaseResponse likeBlog(Long id) {
        return getResult("like",id);
    }*/

    /**
     * 收藏
     * @param id
     * @return
     */
    /*@Override
    public BaseResponse<Object> favoriteBlog(Long id) {
        return getResult("favorite",id);
    }*/

    /*private BaseResponse<Object> getResult(String type,Long id) {
        // 1.获取登录用户
        Long userId = SecurityUser.getUserId();

        // 2.判断当前用户是否点赞
        String key = "imageText:"+type+":"+ id;
        Boolean isMember =  stringRedisTemplate.opsForSet().isMember(key,userId.toString());

        if(BooleanUtil.isFalse(isMember)){
            // 3.如果没点赞，可以点赞
            // 3.1数据库点赞+1
            boolean isSuccess = update().setSql(type + "_count = "+ type +"_count + 1").eq("id", id).update();
            // 3.2保存用户到redis的set集合
            if(isSuccess){
                stringRedisTemplate.opsForSet().add(key,userId.toString());
            }
            if(type.equals("favorite")){
                Articles articles = articlesMapper.selectById(id);
                MyCollections myCollections = new MyCollections();
                myCollections.setUserId(userId);
                myCollections.setArticleId(id);
                myCollections.setIsVideo(articles.getIsVideo());
                myCollections.setCollectTime(new Date(System.currentTimeMillis()));
                myCollectionsMapper.insert(myCollections);
            }
        }else {
            // 4.如果已点赞，取消点赞
            // 4.1数据库数据-1
            boolean isSuccess = update().setSql(type + "_count = "+ type +"_count - 1").eq("id", id).update();
            // 4.2把用户从redis的set集合移除
            if(isSuccess){
                stringRedisTemplate.opsForSet().remove(key,userId.toString());
            }
            if(type.equals("favorite")){
                QueryWrapper<MyCollections> wrapper = new QueryWrapper<>();
                wrapper.eq("article_id",id);
                myCollectionsMapper.delete(wrapper);
            }
        }
        return ResultUtils.success(true);
    }*/

    /**
     * 更新文章浏览量
     * @param viewsCountDTO
     */
    /*@Override
    public void updateArticleViewCount(ViewsCountDTO viewsCountDTO) {
        articlesMapper.updateArticleViewCount(viewsCountDTO);
    }*/

    public static void main(String[] args) {
        System.out.println(BooleanUtil.isTrue(false));
    }
}
