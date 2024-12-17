package com.example.wuyou.utils;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * 阿里云OSS工具类
 */

@Slf4j
@AllArgsConstructor
@Data
public class AliOssUtil {

    private String endpoint;

    private String accessKeyId;

    private String accessKeySecret;

    private String bucketName;

    /**
     * 实现上传文件到OSS
     */
    public String upload(byte[] bytes,String originalFilename) throws IOException {
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);

        log.info("原始文件名:{}",originalFilename);

        String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf("."));

        //目录前缀
        String catalogue = getContentFormat(fileSuffix);
        
        String fileName = catalogue + UUID.randomUUID() + fileSuffix;

        //上传文件到 OSS
        ossClient.putObject(bucketName, fileName, new ByteArrayInputStream(bytes));

        //文件访问路径规则 https://BucketName.Endpoint/ObjectName
        String url = "https://" +
                bucketName +
                "." +
                endpoint +
                "/" +
                fileName;

        // 关闭ossClient
        ossClient.shutdown();
        log.info("文件上传url:{}", url);
        // 把上传到oss的路径返回
        return url;
    }

    public void delete(String objectName){
        OSS ossClient = new OSSClientBuilder().build(endpoint, accessKeyId, accessKeySecret);
        ossClient.deleteObject(bucketName,objectName);
    }

    /**
     * 通过文件名判断并获取OSS服务文件上传时文件的contentFormat(文件格式)
     * @author tony
     * @param fileSuffix 文件名后缀
     * @return 文件的格式代码
     */
    private static String getContentFormat(String fileSuffix) {

        if (fileSuffix.equalsIgnoreCase(".jpeg") ||
                fileSuffix.equalsIgnoreCase(".jpg") ||
                fileSuffix.equalsIgnoreCase(".png") ||
                fileSuffix.equalsIgnoreCase(".gif")) {
            return "pictures/"; // 图片
        }
        if (fileSuffix.equalsIgnoreCase(".html")||
                fileSuffix.equalsIgnoreCase(".txt") ||
                fileSuffix.equalsIgnoreCase(".pptx") ||
                fileSuffix.equalsIgnoreCase(".ppt") ||
                fileSuffix.equalsIgnoreCase(".docx") ||
                fileSuffix.equalsIgnoreCase(".doc") ||
                fileSuffix.equalsIgnoreCase(".xla") ||
                fileSuffix.equalsIgnoreCase(".xlc")||
                fileSuffix.equalsIgnoreCase(".xlm")||
                fileSuffix.equalsIgnoreCase(".xls")||
                fileSuffix.equalsIgnoreCase(".xlt")||
                fileSuffix.equalsIgnoreCase(".xlw") ||
                fileSuffix.equalsIgnoreCase(".xml") ||
                fileSuffix.equalsIgnoreCase(".pdf") ||
                fileSuffix.equalsIgnoreCase(".zip") ||
                fileSuffix.equalsIgnoreCase(".tar")) {
            return "documents/";  //文档
        }
        if (fileSuffix.equalsIgnoreCase(".mp3")) {
            return "musics/"; //音乐
        }
        if (fileSuffix.equalsIgnoreCase(".avi") ||
                fileSuffix.equalsIgnoreCase(".mp4")) {
            return "videos/";     //视频
        }

        //其他
        return "others";
    }

}