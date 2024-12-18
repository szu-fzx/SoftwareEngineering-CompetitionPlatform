package com.example.wuyou.utils;

import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.Date;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * Redis Cache
 */
@Component
public class RedisCache {

    @Resource
    private RedisTemplate<String,Object> redisTemplate;

    /**
     * 默认过期时长为24小时，单位：秒
     */
    public final static long DEFAULT_EXPIRE = 60 * 60 * 24L;
    /**
     * 过期时长为1小时，单位：秒
     */
    public final static long HOUR_ONE_EXPIRE = 60 * 60 * 1L;

    /**
     * 过期时长为5分钟，单位：秒
     */
    public final static long HOUR_HALF_EXPIRE = 60 * 30L;

    /**
     * 过期时长为6小时，单位：秒
     */
    public final static long HOUR_SIX_EXPIRE = 60 * 60 * 6L;

    /**
     * 过期时长为14天，单位：秒
     */
    public final static long DAY_FOURTEEN_EXPIRE = 60 * 60 * 24 * 14L;

    /**
     * 不设置过期时长
     */
    public final static long NOT_EXPIRE = -1L;

    public void expire(String key,long expire){
        redisTemplate.expire(key,expire, TimeUnit.SECONDS);
    }

    public void set(String key,Object value,Long expire){
        redisTemplate.opsForValue().set(key,value);
        if(expire != NOT_EXPIRE){
            expire(key,expire);
        }
    }

    public Object get(String key,long expire){
        Object value = redisTemplate.opsForValue().get(key);
        if(expire != NOT_EXPIRE){
            expire(key,expire);
        }
        return value;
    }

    public Object get(String key){
        return get(key,NOT_EXPIRE);
    }

    public Long increment(String key){
        return redisTemplate.opsForValue().increment(key);
    }

    public Boolean hasKey(String key){
        return redisTemplate.hasKey(key);
    }

    public Set<String> keys(String pattern){
        return redisTemplate.keys(pattern);
    }

    public void delete(String key){
        redisTemplate.delete(key);
    }

    public void delete(Collection<String> keys){
        redisTemplate.delete(keys);
    }
    //key可以理解为对象，而field可以理解为对象的各个属性，属性还可以赋值

    /**
     * 获取Hash的key的field中的值
     * @param key
     * @param field
     * @return
     */
    public Object hGet(String key,String field){
        return redisTemplate.opsForHash().get(key,field);
    }

    public Map<String,Object> hGetAll(String key){
        HashOperations<String,String,Object> hashOperations = redisTemplate.opsForHash();
        return hashOperations.entries(key);
    }

    public void hMSet(String key,Map<String,Object> map){
        hMSet(key,map,DEFAULT_EXPIRE);
    }

    public void hMSet(String key,Map<String,Object> map,long expire){
        redisTemplate.opsForHash().putAll(key,map);
        if(expire != NOT_EXPIRE){
            expire(key,expire);
        }
    }

    public void hSet(String key,String field,Object value){
        hSet(key,field,value,DEFAULT_EXPIRE);
    }
    public void hSet(String key,String field,Object value,long expire){
        redisTemplate.opsForHash().put(key,field,value);

        if(expire != NOT_EXPIRE){
            expire(key,expire);
        }
    }

    public void expireAt(String key, Date expire){
        redisTemplate.expireAt(key,expire);
    }

    public Long getExpire(String key){
        return redisTemplate.getExpire(key,TimeUnit.SECONDS);
    }

    public void hDel(String key,Object... field){
        redisTemplate.opsForHash().delete(key,field);
    }

    public void leftPush(String key,Object value){
        leftPush(key,value,DEFAULT_EXPIRE);
    }

    public void leftPush(String key,Object value,long expire){
        redisTemplate.opsForList().leftPush(key,value);

        if(expire != NOT_EXPIRE){
            expire(key,expire);
        }
    }
}
