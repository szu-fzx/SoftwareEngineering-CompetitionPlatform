-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2024-12-17 09:02:47
-- 服务器版本： 9.1.0
-- PHP 版本： 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `wuyou_recruit`
--

-- --------------------------------------------------------

--
-- 表的结构 `apply`
--

DROP TABLE IF EXISTS `apply`;
CREATE TABLE IF NOT EXISTS `apply` (
  `id` char(8) NOT NULL COMMENT '主键',
  `user_id` char(8) NOT NULL COMMENT '用户id',
  `data_id` char(8) NOT NULL COMMENT '数据id',
  `type` smallint NOT NULL COMMENT '应聘类型',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='应聘信息';

--
-- 转存表中的数据 `apply`
--

INSERT INTO `apply` (`id`, `user_id`, `data_id`, `type`, `create_time`) VALUES
('HnhDq2cO', '', '', 0, 1733299880.677),
('q6P82aEQ', '', '', 0, 1733299934.822),
('PDSyCGds', 'eYAnBmjO', 'n8L8yoNF', 0, 1733299958.328);

-- --------------------------------------------------------

--
-- 表的结构 `browse`
--

DROP TABLE IF EXISTS `browse`;
CREATE TABLE IF NOT EXISTS `browse` (
  `id` char(8) NOT NULL COMMENT '主键',
  `user_id` char(8) NOT NULL COMMENT '用户id',
  `data_id` char(8) NOT NULL COMMENT '数据id',
  `type` smallint NOT NULL COMMENT '浏览类型',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='浏览信息';

--
-- 转存表中的数据 `browse`
--

INSERT INTO `browse` (`id`, `user_id`, `data_id`, `type`, `create_time`) VALUES
('5wc7vCNT', 'eYAnBmjO', 'n5u94kAu', 0, 1733299953.381);

-- --------------------------------------------------------

--
-- 表的结构 `cms`
--

DROP TABLE IF EXISTS `cms`;
CREATE TABLE IF NOT EXISTS `cms` (
  `id` char(8) NOT NULL COMMENT '主键',
  `text` varchar(1000) NOT NULL COMMENT '内容',
  `type` smallint NOT NULL COMMENT '内容类型',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统内容信息';

-- --------------------------------------------------------

--
-- 表的结构 `collect`
--

DROP TABLE IF EXISTS `collect`;
CREATE TABLE IF NOT EXISTS `collect` (
  `id` char(8) NOT NULL COMMENT '主键',
  `user_id` char(8) NOT NULL COMMENT '用户id',
  `data_id` char(8) NOT NULL COMMENT '数据id',
  `type` smallint NOT NULL COMMENT '收藏类型',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='收藏信息';

--
-- 转存表中的数据 `collect`
--

INSERT INTO `collect` (`id`, `user_id`, `data_id`, `type`, `create_time`) VALUES
('P40obrcP', 'eYAnBmjO', 'n8L8yoNF', 0, 1733299961.208);

-- --------------------------------------------------------

--
-- 表的结构 `company`
--

DROP TABLE IF EXISTS `company`;
CREATE TABLE IF NOT EXISTS `company` (
  `id` char(8) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '简称',
  `full_name` varchar(50) NOT NULL COMMENT '全称',
  `logo` varchar(255) NOT NULL DEFAULT 'https://pan.whiteones.cn/d/PicGo/wuyou/company_icon.png' COMMENT 'logo地址',
  `industry_id` char(8) NOT NULL COMMENT '行业id',
  `nature` smallint NOT NULL COMMENT '公司性质',
  `staff_size` varchar(255) NOT NULL COMMENT '公司规模',
  `introduce` varchar(500) NOT NULL COMMENT '公司简介',
  `address` varchar(255) NOT NULL COMMENT '地址详情',
  `auth_id` char(8) DEFAULT NULL COMMENT '认证id',
  `work_time` varchar(255) NOT NULL COMMENT '工作时间',
  `rest_time` varchar(255) NOT NULL COMMENT '休息时间',
  `work_overtime` varchar(255) NOT NULL COMMENT '加班情况',
  `enable_status` tinyint(1) DEFAULT NULL COMMENT '生效状态',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  `update_time` double(13,3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司信息';

--
-- 转存表中的数据 `company`
--

INSERT INTO `company` (`id`, `name`, `full_name`, `logo`, `industry_id`, `nature`, `staff_size`, `introduce`, `address`, `auth_id`, `work_time`, `rest_time`, `work_overtime`, `enable_status`, `create_time`, `update_time`) VALUES
('n5u94kAu', 'test', 'xxx', 'https://pan.whiteones.cn/d/PicGo/wuyou/company_icon.png', '30072166', 0, '0-20人', '', '', NULL, '', '', '', NULL, 1733299801.167, 1733299801.167);

-- --------------------------------------------------------

--
-- 表的结构 `company_auth`
--

DROP TABLE IF EXISTS `company_auth`;
CREATE TABLE IF NOT EXISTS `company_auth` (
  `id` char(8) NOT NULL COMMENT '主键',
  `legal_person` varchar(50) NOT NULL COMMENT '法人姓名',
  `credit_code` char(18) NOT NULL COMMENT '统一社会信用代码',
  `auth_status` smallint NOT NULL DEFAULT '1' COMMENT '认证状态',
  `failure_reason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  `submit_time` double(13,3) NOT NULL COMMENT '提交时间',
  `finished_time` double(13,3) NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业认证信息';

-- --------------------------------------------------------

--
-- 表的结构 `company_welfare`
--

DROP TABLE IF EXISTS `company_welfare`;
CREATE TABLE IF NOT EXISTS `company_welfare` (
  `id` char(8) NOT NULL COMMENT '主键',
  `company_id` char(8) NOT NULL COMMENT '公司id',
  `welfare_id` char(8) NOT NULL COMMENT '福利id',
  `enable_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '生效状态',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  `update_time` double(13,3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='公司福利信息';

-- --------------------------------------------------------

--
-- 表的结构 `industry`
--

DROP TABLE IF EXISTS `industry`;
CREATE TABLE IF NOT EXISTS `industry` (
  `id` char(8) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `p_id` char(8) DEFAULT NULL COMMENT '父级id',
  `enable_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用状态',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  `update_time` double(13,3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='行业信息';

--
-- 转存表中的数据 `industry`
--

INSERT INTO `industry` (`id`, `name`, `icon`, `p_id`, `enable_status`, `create_time`, `update_time`) VALUES
('0348d077', '证券/期货', NULL, '623bf114', 1, 1648650196.781, 1648650196.781),
('07ad4cb8', '汽车生产', NULL, 'a06cf718', 1, 1648650196.781, 1648650196.781),
('0c7db0e5', '银行', NULL, '623bf114', 1, 1648650196.781, 1648650196.781),
('0e2e40c7', '家政服务', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('0fb1a275', '学术/科研', NULL, '623bf123', 1, 1648650196.781, 1648650196.781),
('14863727', '电力/热力/燃气', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('2087b7a7', '船舶/航空', NULL, 'fba7613b', 1, 1648650196.781, 1648650196.781),
('25ea9049', '新零售', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('2935fe25', '检测/认证', NULL, '31c735e5', 1, 1648650196.781, 1648650196.781),
('2d83ad29', '回收/维修', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('2d8df75a', '新能源', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('30072166', '能源/化工/环保', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('31c735e5', '专业服务', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('4225fe3d', '环保', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('473face2', '生活服务', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('4c8a363c', '工艺品/收藏品', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('52c96d04', '日化', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('56d5dab9', '汽车零部件', NULL, 'a06cf718', 1, 1648650196.781, 1648650196.781),
('5771afdb', '制药', NULL, '92e589dc', 1, 1648650196.781, 1648650196.781),
('583d3b26', '服装/纺织/皮革', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('5a538ce0', '咨询', NULL, '31c735e5', 1, 1648650196.781, 1648650196.781),
('5b4efcfc', '房地产/建筑', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('5d1160fe', '服务业', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('5dec1ee7', '翻译', NULL, '31c735e5', 1, 1648650196.781, 1648650196.781),
('623bcdbb', '互联网/IT/电子/通信', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('623bd63e', '电子商务', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('623bdb4e', '广告/传媒/文化/体育', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('623bde06', '游戏', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('623bf090', '广播/影视', NULL, '623bdb4e', 1, 1648650196.781, 1648650196.781),
('623bf0a8', '文化/体育/娱乐', NULL, '623bdb4e', 1, 1648650196.781, 1648650196.781),
('623bf0bd', '数据服务', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('623bf0cf', '保险', NULL, '623bf114', 1, 1648650196.781, 1648650196.781),
('623bf0e2', '学前教育', NULL, '623bf123', 1, 1648650196.781, 1648650196.781),
('623bf0f7', '广告/公关/会展', NULL, '623bdb4e', 1, 1648650196.781, 1648650196.781),
('623bf108', '新闻/出版', NULL, '623bdb4e', 1, 1648650196.781, 1648650196.781),
('623bf114', '金融', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('623bf123', '教育培训', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('624467d5', '消费电子', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('633a95d6', '培训机构', NULL, '623bf123', 1, 1648650196.781, 1648650196.781),
('63acdc4b', '珠宝/首饰', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('66aaec7f', '互联网金融', NULL, '623bf114', 1, 1648650196.781, 1648650196.781),
('67596dc6', '消费品', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('6aa6cc68', '其他专业服务', NULL, '31c735e5', 1, 1648650196.781, 1648650196.781),
('6c80258f', '装饰装修', NULL, '5b4efcfc', 1, 1648650196.781, 1648650196.781),
('6fce60d6', '石油/石化', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('71d2521f', '机械设备/机电/重工', NULL, 'fba7613b', 1, 1648650196.781, 1648650196.781),
('753cc505', '矿产/地质', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('75c94000', '交通/运输', NULL, 'fd7afdc0', 1, 1648650196.781, 1648650196.781),
('778cd48f', '仪器仪表/工业自动化', NULL, 'fba7613b', 1, 1648650196.781, 1648650196.781),
('7959133b', '建筑设计', NULL, '5b4efcfc', 1, 1648650196.781, 1648650196.781),
('797c5533', '基金', NULL, '623bf114', 1, 1648650196.781, 1648650196.781),
('7c29b6f5', '餐饮', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('7d540415', '企业服务', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('7dd687d5', '物流/仓储', NULL, 'fd7afdc0', 1, 1648650196.781, 1648650196.781),
('83e1fed4', '旅游', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('86727741', '婚庆/摄影', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('8a98c54d', '美容/美发', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('8a998c99', '印刷/包装', NULL, 'fba7613b', 1, 1648650196.781, 1648650196.781),
('8f02efb5', '化工', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('8fb99e64', '家具/家电', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('92e589dc', '制药/医疗', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('9f03ebeb', '采掘/冶炼', NULL, '30072166', 1, 1648650196.781, 1648650196.781),
('a0672532', '智能硬件', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('a06cf718', '汽车', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('a0a132a8', '医疗/护理/卫生', NULL, '92e589dc', 1, 1648650196.781, 1648650196.781),
('a3d018b3', '食品/饮料/烟酒', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('a78b81b3', '宠物服务', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('a7b24103', '酒店', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('aaeed93c', '社交网络', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('b851d42b', '人力资源服务', NULL, '31c735e5', 1, 1648650196.781, 1648650196.781),
('be66ec3d', '批发/零售', NULL, 'fd7afdc0', 1, 1648650196.781, 1648650196.781),
('cc44ed46', '原材料/模具', NULL, 'fba7613b', 1, 1648650196.781, 1648650196.781),
('cd86d30b', '法律', NULL, '31c735e5', 1, 1648650196.781, 1648650196.781),
('d2d7a657', '信托', NULL, '623bf114', 1, 1648650196.781, 1648650196.781),
('d337102e', '休闲/娱乐', NULL, '5d1160fe', 1, 1648650196.781, 1648650196.781),
('d79437bc', '医疗设备/器械', NULL, '92e589dc', 1, 1648650196.781, 1648650196.781),
('d85bc82d', 'O2O', NULL, '623bcdbb', 1, 1648650196.781, 1648650196.781),
('dadbd91a', '地产中介', NULL, '5b4efcfc', 1, 1648650196.781, 1648650196.781),
('e2086800', '建材', NULL, '5b4efcfc', 1, 1648650196.781, 1648650196.781),
('e2ca4f9f', '4S店/后市场', NULL, 'a06cf718', 1, 1648650196.781, 1648650196.781),
('e50bc59d', '房地产开发', NULL, '5b4efcfc', 1, 1648650196.781, 1648650196.781),
('e90545b4', '玩具/礼品', NULL, '67596dc6', 1, 1648650196.781, 1648650196.781),
('f40183e9', '院校', NULL, '623bf123', 1, 1648650196.781, 1648650196.781),
('f9aedbc9', '贸易/进出口', NULL, 'fd7afdc0', 1, 1648650196.781, 1648650196.781),
('fba7613b', '机械/制造', NULL, NULL, 1, 1648650196.781, 1648650196.781),
('fd7afdc0', '交通/物流/贸易/零售', NULL, NULL, 1, 1648650196.781, 1648650196.781);

-- --------------------------------------------------------

--
-- 表的结构 `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` char(8) NOT NULL COMMENT '主键',
  `company_id` char(8) NOT NULL COMMENT '公司id',
  `post_id` char(8) NOT NULL COMMENT '职位id',
  `enable_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '生效状态',
  `exp_require` smallint NOT NULL COMMENT '经验要求',
  `min_education` smallint DEFAULT NULL COMMENT '最低学历',
  `salary` smallint NOT NULL COMMENT '薪资范围',
  `job_type` smallint NOT NULL COMMENT '工作类型',
  `skill` varchar(500) NOT NULL COMMENT '技能要求',
  `create_time` double NOT NULL COMMENT '创建时间',
  `update_time` double NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='工作招聘信息';

--
-- 转存表中的数据 `job`
--

INSERT INTO `job` (`id`, `company_id`, `post_id`, `enable_status`, `exp_require`, `min_education`, `salary`, `job_type`, `skill`, `create_time`, `update_time`) VALUES
('n8L8yoNF', 'n5u94kAu', '1bd54b2a', 0, 0, 0, 0, 0, '', 1733299863.194, 1733299863.194);

-- --------------------------------------------------------

--
-- 表的结构 `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `id` char(8) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `p_id` char(8) DEFAULT NULL COMMENT '父级id',
  `enable_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用状态',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  `update_time` double(13,3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='职位信息';

--
-- 转存表中的数据 `position`
--

INSERT INTO `position` (`id`, `name`, `icon`, `p_id`, `enable_status`, `create_time`, `update_time`) VALUES
('0031a478', '互联网产品经理', NULL, '843c32b8', 1, 1648112091.084, 1648112091.084),
('0041a9ff', '信贷专员', NULL, 'a5793137', 1, 1648112091.084, 1648112091.084),
('01f76575', '物业经理', NULL, '988bb6e1', 1, 1648112091.084, 1648112091.084),
('03dcc359', '工程造价', NULL, '1ea00499', 1, 1648112091.084, 1648112091.084),
('05127dcd', '服装导购', NULL, '62446ed8', 1, 1648112091.084, 1648112091.084),
('08d63267', '美工', NULL, '8229aae5', 1, 1648112091.084, 1648112091.084),
('091cefbb', '化妆师', NULL, '92e9bde7', 1, 1648112091.084, 1648112091.084),
('0bd1ac7a', '制片人', NULL, '0c906321', 1, 1648112091.084, 1648112091.084),
('0c906321', '影视媒体', NULL, '8316c048', 1, 1648112091.084, 1648112091.084),
('0de239ce', '客户经理', NULL, 'a5793137', 1, 1648112091.084, 1648112091.084),
('0e3c74a3', '地产中介', NULL, '62446e8d', 1, 1648112091.084, 1648112091.084),
('11cecdf0', '职业培训', NULL, 'da622418', 1, 1648112091.084, 1648112091.084),
('1498de76', '教师', NULL, 'fd96b7ef', 1, 1648112091.084, 1648112091.084),
('14ec0dee', '总裁/CEO', NULL, '1b9967bc', 1, 1648112091.084, 1648112091.084),
('1576abb0', 'Java开发', NULL, '62446f6c', 1, 1648112091.084, 1648112091.084),
('16621e35', '自动化测试', NULL, '62446fc8', 1, 1648112091.084, 1648112091.084),
('17cf767b', '教学管理', NULL, 'dc872f8f', 1, 1648112091.084, 1648112091.084),
('192f415e', '美容师', NULL, '92e9bde7', 1, 1648112091.084, 1648112091.084),
('1a230e57', '助教', NULL, 'fd96b7ef', 1, 1648112091.084, 1648112091.084),
('1a79380b', '证券/基金', NULL, 'c990d22a', 1, 1648112091.084, 1648112091.084),
('1b06b828', '汽车维修', NULL, '29c64e83', 1, 1648112091.084, 1648112091.084),
('1b9967bc', '高级管理职位', NULL, 'd23ebd1d', 1, 1648112091.084, 1648112091.084),
('1bd54b2a', '客服专员', NULL, '6a8386c9', 1, 1648112091.084, 1648112091.084),
('1c9a03ee', '汽车配件销售', NULL, '62446ef2', 1, 1648112091.084, 1648112091.084),
('1db89baa', '运营/客服', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('1ea00499', '工程管理', NULL, '3079d866', 1, 1648112091.084, 1648112091.084),
('1edb5ee8', '其他产品经理', NULL, 'e1a80b48', 1, 1648112091.084, 1648112091.084),
('22c5cd44', '用户研究经理', NULL, 'f9c83146', 1, 1648112091.084, 1648112091.084),
('23ea540b', '保险理赔', NULL, '61f6f6a7', 1, 1648112091.084, 1648112091.084),
('2781705f', '摄影/摄像', NULL, '0c906321', 1, 1648112091.084, 1648112091.084),
('29c64e83', '汽车服务', NULL, 'b4f90626', 1, 1648112091.084, 1648112091.084),
('2a1b26bc', '副总裁/VP', NULL, '1b9967bc', 1, 1648112091.084, 1648112091.084),
('2b33739d', '全栈工程师', NULL, '62446f6c', 1, 1648112091.084, 1648112091.084),
('2b3eea33', '地产招投标', NULL, '6c43e275', 1, 1648112091.084, 1648112091.084),
('2cd730be', '广告销售', NULL, '62446efb', 1, 1648112091.084, 1648112091.084),
('2e236363', '律师顾问', NULL, '62446f53', 1, 1648112091.084, 1648112091.084),
('2f0049fc', '基金经理', NULL, '1a79380b', 1, 1648112091.084, 1648112091.084),
('30054462', '测试工程师', NULL, '62446fc8', 1, 1648112091.084, 1648112091.084),
('3079d866', '房地产/建筑', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('309454bb', '直播运营', NULL, 'a5335b5d', 1, 1648112091.084, 1648112091.084),
('35b656bb', '宠物美容', NULL, 'afe9d3e5', 1, 1648112091.084, 1648112091.084),
('36b9e041', '电工', NULL, '47371b78', 1, 1648112091.084, 1648112091.084),
('37e0814e', '硬件产品经理', NULL, 'e1a80b48', 1, 1648112091.084, 1648112091.084),
('38d56bf6', '洗车工', NULL, '29c64e83', 1, 1648112091.084, 1648112091.084),
('38dcddbc', '系统策划', NULL, 'bbeb2063', 1, 1648112091.084, 1648112091.084),
('43a280a6', '量化研究员', NULL, '1a79380b', 1, 1648112091.084, 1648112091.084),
('45d1a305', '后勤', NULL, '62446f49', 1, 1648112091.084, 1648112091.084),
('45eea2e6', '物业管理员', NULL, '988bb6e1', 1, 1648112091.084, 1648112091.084),
('47371b78', '建筑装修工人', NULL, '3079d866', 1, 1648112091.084, 1648112091.084),
('4997c261', '地产项目管理', NULL, '6c43e275', 1, 1648112091.084, 1648112091.084),
('4d76fa8a', '法务经理/主管', NULL, '62446f53', 1, 1648112091.084, 1648112091.084),
('4dedcd7c', '保姆', NULL, 'fd0cf55b', 1, 1648112091.084, 1648112091.084),
('53d43c0c', '游泳教练', NULL, 'c859a788', 1, 1648112091.084, 1648112091.084),
('55f21175', '行政经理/主管', NULL, '62446f49', 1, 1648112091.084, 1648112091.084),
('5cebe21b', '保安', NULL, '988bb6e1', 1, 1648112091.084, 1648112091.084),
('5d62c161', '发型师', NULL, '92e9bde7', 1, 1648112091.084, 1648112091.084),
('61f6f6a7', '保险', NULL, 'c990d22a', 1, 1648112091.084, 1648112091.084),
('623c31db', '销售', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('623c31eb', '销售行政/商务', NULL, '623c31db', 1, 1648112091.084, 1648112091.084),
('623f0bc3', '人力资源助理', NULL, '62446f20', 1, 1648112091.084, 1648112091.084),
('62446cd3', '人事/行政/法务', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('62446e8d', '房地产销售/招商', NULL, '623c31db', 1, 1648112091.084, 1648112091.084),
('62446ed8', '服务业销售', NULL, '623c31db', 1, 1648112091.084, 1648112091.084),
('62446ef2', '汽车销售', NULL, '623c31db', 1, 1648112091.084, 1648112091.084),
('62446efb', '广告/会展销售', NULL, '623c31db', 1, 1648112091.084, 1648112091.084),
('62446f20', '人力资源', NULL, '62446cd3', 1, 1648112091.084, 1648112091.084),
('62446f49', '行政', NULL, '62446cd3', 1, 1648112091.084, 1648112091.084),
('62446f53', '法务', NULL, '62446cd3', 1, 1648112091.084, 1648112091.084),
('62446f62', 'IT互联网技术', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('62446f6c', '后端开发', NULL, '62446f62', 1, 1648112091.084, 1648112091.084),
('62446fa5', '移动开发', NULL, '62446f62', 1, 1648112091.084, 1648112091.084),
('62446fc8', '测试', NULL, '62446f62', 1, 1648112091.084, 1648112091.084),
('624c525f', '生产制造', NULL, '66c4d212', 1, 1648112091.084, 1648112091.084),
('624c5275', '包装', NULL, '624c525f', 1, 1648112091.084, 1648112091.084),
('624c52a7', '喷漆', NULL, '624c525f', 1, 1648112091.084, 1648112091.084),
('624c52ae', '打磨', NULL, '624c525f', 1, 1648112091.084, 1648112091.084),
('6253ebb0', '平车', NULL, '624c525f', 1, 1648112091.084, 1648112091.084),
('6298d022', '家具设计', NULL, 'c226c2ce', 1, 1648112091.084, 1648112091.084),
('66c4d212', '市场', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('674594bf', '培训师', NULL, '11cecdf0', 1, 1648112091.084, 1648112091.084),
('68379503', '游戏策划', NULL, 'bbeb2063', 1, 1648112091.084, 1648112091.084),
('6a8386c9', '客服', NULL, '1db89baa', 1, 1648112091.084, 1648112091.084),
('6bd6a810', 'IOS开发', NULL, '62446fa5', 1, 1648112091.084, 1648112091.084),
('6c43e275', '房地产规划开发', NULL, '3079d866', 1, 1648112091.084, 1648112091.084),
('6d57231b', '材料员', NULL, '1ea00499', 1, 1648112091.084, 1648112091.084),
('711064f7', '商务专员', NULL, '623c31eb', 1, 1648112091.084, 1648112091.084),
('716d4eb8', '会展活动销售', NULL, '62446efb', 1, 1648112091.084, 1648112091.084),
('73e4f70e', 'HRBP', NULL, '62446f20', 1, 1648112091.084, 1648112091.084),
('7518ee4b', '网络推广', NULL, 'f5db9f59', 1, 1648112091.084, 1648112091.084),
('7594c1af', '平面设计', NULL, '8229aae5', 1, 1648112091.084, 1648112091.084),
('7756b5f9', '客服主管', NULL, '6a8386c9', 1, 1648112091.084, 1648112091.084),
('7961491d', '会议活动销售', NULL, '62446efb', 1, 1648112091.084, 1648112091.084),
('7d09114f', '广告审核', NULL, 'e59ab60b', 1, 1648112091.084, 1648112091.084),
('8090d56c', '销售助理', NULL, '623c31eb', 1, 1648112091.084, 1648112091.084),
('8229aae5', '视觉/交互设计', NULL, 'faa146c1', 1, 1648112091.084, 1648112091.084),
('826f9cee', '家教', NULL, 'fd96b7ef', 1, 1648112091.084, 1648112091.084),
('8316c048', '影视/传媒', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('843c32b8', '产品', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('85a52d1e', '联合创始人', NULL, '1b9967bc', 1, 1648112091.084, 1648112091.084),
('86e0d02d', '教务管理', NULL, 'dc872f8f', 1, 1648112091.084, 1648112091.084),
('870f8ed6', '媒介投放', NULL, 'e59ab60b', 1, 1648112091.084, 1648112091.084),
('874283f7', '市场营销', NULL, 'f5db9f59', 1, 1648112091.084, 1648112091.084),
('87ce080d', '月嫂', NULL, 'fd0cf55b', 1, 1648112091.084, 1648112091.084),
('88565d2d', '宠物医生', NULL, 'afe9d3e5', 1, 1648112091.084, 1648112091.084),
('89ab90ad', '保险精算师', NULL, '61f6f6a7', 1, 1648112091.084, 1648112091.084),
('8d154d3f', '主播', NULL, '0c906321', 1, 1648112091.084, 1648112091.084),
('8f9f2b9e', '测绘/测量', NULL, '1ea00499', 1, 1648112091.084, 1648112091.084),
('92e9bde7', '美容美发', NULL, 'b4f90626', 1, 1648112091.084, 1648112091.084),
('953fb7e2', '保洁', NULL, 'fd0cf55b', 1, 1648112091.084, 1648112091.084),
('971b310a', '施工员', NULL, '1ea00499', 1, 1648112091.084, 1648112091.084),
('988bb6e1', '物业管理', NULL, '3079d866', 1, 1648112091.084, 1648112091.084),
('9bcfc81d', '产品助理', NULL, '0031a478', 1, 1648112091.084, 1648112091.084),
('a2b27f23', '广告制作', NULL, 'e59ab60b', 1, 1648112091.084, 1648112091.084),
('a5335b5d', '内容运营', NULL, '1db89baa', 1, 1648112091.084, 1648112091.084),
('a5793137', '银行', NULL, 'c990d22a', 1, 1648112091.084, 1648112091.084),
('a679eaa6', '舞蹈老师', NULL, 'c859a788', 1, 1648112091.084, 1648112091.084),
('a93e1e32', '金融产品经理', NULL, 'e1a80b48', 1, 1648112091.084, 1648112091.084),
('a94bf91a', '品类运营', NULL, 'e3abbc60', 1, 1648112091.084, 1648112091.084),
('aaab8388', '新媒体运营', NULL, 'a5335b5d', 1, 1648112091.084, 1648112091.084),
('ab8e935f', '商务渠道', NULL, 'f5db9f59', 1, 1648112091.084, 1648112091.084),
('ace108a0', 'AI产品经理', NULL, '0031a478', 1, 1648112091.084, 1648112091.084),
('ae8f614c', '游戏制作人', NULL, 'bbeb2063', 1, 1648112091.084, 1648112091.084),
('afcd5205', '人力资源经理', NULL, '62446f20', 1, 1648112091.084, 1648112091.084),
('afe9d3e5', '宠物服务', NULL, 'b4f90626', 1, 1648112091.084, 1648112091.084),
('b4f90626', '生活服务', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('b63a62fe', '设计师助理', NULL, '8229aae5', 1, 1648112091.084, 1648112091.084),
('b690ffed', '行政专员/助理', NULL, '62446f49', 1, 1648112091.084, 1648112091.084),
('b849efd5', '美容顾问', NULL, '62446ed8', 1, 1648112091.084, 1648112091.084),
('bbeb2063', '游戏策划/制作', NULL, '843c32b8', 1, 1648112091.084, 1648112091.084),
('bc579739', '法务专员/助理', NULL, '62446f53', 1, 1648112091.084, 1648112091.084),
('bd55ba6c', '工业设计', NULL, 'c226c2ce', 1, 1648112091.084, 1648112091.084),
('bffeebee', '健身教练', NULL, 'c859a788', 1, 1648112091.084, 1648112091.084),
('c01fba46', '证券交易员', NULL, '1a79380b', 1, 1648112091.084, 1648112091.084),
('c1ae8bc6', 'UI设计师', NULL, '8229aae5', 1, 1648112091.084, 1648112091.084),
('c226c2ce', '工业/家居设计', NULL, 'faa146c1', 1, 1648112091.084, 1648112091.084),
('c7fe0fd2', '淘宝运营', NULL, 'e3abbc60', 1, 1648112091.084, 1648112091.084),
('c84b74da', 'C++开发', NULL, '62446f6c', 1, 1648112091.084, 1648112091.084),
('c859a788', '运动健身', NULL, 'b4f90626', 1, 1648112091.084, 1648112091.084),
('c862cfe7', '木工', NULL, '47371b78', 1, 1648112091.084, 1648112091.084),
('c990d22a', '金融', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('cb969e6f', '置业顾问', NULL, '62446e8d', 1, 1648112091.084, 1648112091.084),
('cfa822d2', '绿化工', NULL, '988bb6e1', 1, 1648112091.084, 1648112091.084),
('d1077fba', 'Android开发', NULL, '62446fa5', 1, 1648112091.084, 1648112091.084),
('d23ebd1d', '高级管理', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('d2f694c0', '产品经理', NULL, '0031a478', 1, 1648112091.084, 1648112091.084),
('d34e3b45', '市场推广', NULL, 'f5db9f59', 1, 1648112091.084, 1648112091.084),
('d7e3e847', '油漆工', NULL, '47371b78', 1, 1648112091.084, 1648112091.084),
('d905d312', '焊工', NULL, '47371b78', 1, 1648112091.084, 1648112091.084),
('d9771485', '人力资源总监', NULL, '62446f20', 1, 1648112091.084, 1648112091.084),
('d9a8aa58', '柜员', NULL, 'a5793137', 1, 1648112091.084, 1648112091.084),
('da622418', '教育培训', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('dc872f8f', '教育行政', NULL, 'da622418', 1, 1648112091.084, 1648112091.084),
('dc957ec2', '室内设计', NULL, 'c226c2ce', 1, 1648112091.084, 1648112091.084),
('def04b44', '天猫运营', NULL, 'e3abbc60', 1, 1648112091.084, 1648112091.084),
('e1a80b48', '其他产品职位', NULL, '843c32b8', 1, 1648112091.084, 1648112091.084),
('e3abbc60', '电商运营', NULL, '1db89baa', 1, 1648112091.084, 1648112091.084),
('e4bcc3df', '珠宝销售', NULL, '62446ed8', 1, 1648112091.084, 1648112091.084),
('e552569f', '京东运营', NULL, 'e3abbc60', 1, 1648112091.084, 1648112091.084),
('e59ab60b', '广告', NULL, '8316c048', 1, 1648112091.084, 1648112091.084),
('e8b4e8f2', '拓展培训', NULL, '11cecdf0', 1, 1648112091.084, 1648112091.084),
('f0ed0a88', '区域负责人', NULL, '1b9967bc', 1, 1648112091.084, 1648112091.084),
('f4ca753b', '售后客服', NULL, '6a8386c9', 1, 1648112091.084, 1648112091.084),
('f59da600', '护工', NULL, 'fd0cf55b', 1, 1648112091.084, 1648112091.084),
('f5db9f59', '市场/营销', NULL, '66c4d212', 1, 1648112091.084, 1648112091.084),
('f8af6459', 'Python开发', NULL, '62446f6c', 1, 1648112091.084, 1648112091.084),
('f8ebd59b', '汽车销售', NULL, '62446ef2', 1, 1648112091.084, 1648112091.084),
('f9c83146', '用户研究', NULL, '66c4d212', 1, 1648112091.084, 1648112091.084),
('faa146c1', '设计', NULL, NULL, 1, 1648112091.084, 1648112091.084),
('fac46be4', '用户研究员', NULL, 'f9c83146', 1, 1648112091.084, 1648112091.084),
('fd0cf55b', '家政保洁', NULL, 'b4f90626', 1, 1648112091.084, 1648112091.084),
('fd11e5c3', '汽车美容', NULL, '29c64e83', 1, 1648112091.084, 1648112091.084),
('fd96b7ef', '教师', NULL, 'da622418', 1, 1648112091.084, 1648112091.084);

-- --------------------------------------------------------

--
-- 表的结构 `resume`
--

DROP TABLE IF EXISTS `resume`;
CREATE TABLE IF NOT EXISTS `resume` (
  `id` char(8) NOT NULL COMMENT '主键',
  `user_id` char(8) NOT NULL COMMENT '用户id',
  `birthday` varchar(255) DEFAULT NULL COMMENT '出生日期',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `gender` smallint NOT NULL COMMENT '性别',
  `hometown` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '家乡',
  `college` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '认证学校',
  `college_state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '认证身份',
  `college_year` varchar(10) NOT NULL COMMENT '入学年份',
  `phone` varchar(50) NOT NULL COMMENT '手机号',
  `education` smallint DEFAULT NULL COMMENT '最高学历',
  `experience` smallint DEFAULT NULL COMMENT '工作经验',
  `skill` varchar(500) DEFAULT NULL COMMENT '个人特长',
  `job_status` smallint DEFAULT NULL COMMENT '求职状态',
  `salary` smallint DEFAULT NULL COMMENT '期望薪资',
  `post_id` char(8) DEFAULT NULL COMMENT '期望职位',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简历信息';

--
-- 转存表中的数据 `resume`
--

INSERT INTO `resume` (`id`, `user_id`, `birthday`, `name`, `gender`, `hometown`, `college`, `college_state`, `college_year`, `phone`, `education`, `experience`, `skill`, `job_status`, `salary`, `post_id`, `create_time`) VALUES
('Bf4Rji0N', 'eYAnBmjO', '2024-12-04', 'XXX', 0, '', '', '', '0', '', 0, 1, NULL, NULL, NULL, NULL, 1733300644.000);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` char(8) NOT NULL COMMENT '主键',
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信用户id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `mobile` char(11) DEFAULT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL DEFAULT 'https://pan.whiteones.cn/d/PicGo/wuyou/avatar_def.jpg' COMMENT '头像地址',
  `role` smallint NOT NULL DEFAULT '0' COMMENT '用户角色',
  `company_id` char(8) DEFAULT NULL COMMENT '公司id',
  `enable_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账号状态',
  `auth_id` char(8) DEFAULT NULL COMMENT '认证id',
  `register_date` double(13,3) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `open_id`, `username`, `password`, `mobile`, `avatar`, `role`, `company_id`, `enable_status`, `auth_id`, `register_date`) VALUES
('eYAnBmjO', 'oFS8f7SRPRsXAchztTXHekbmLtko', '微信用户', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/POgEwh4mIHO4nibH0KlMECNjjGxQUq24ZEaGT4poC6icRiccVGKSyXwibcPq4BWmiaIGuG1icwxaQX6grC9VemZoJ8rg/132', 0, 'n5u94kAu', 0, NULL, 1733299015.078),
('88888888', NULL, 'admin', 'admin', '11111111111', 'https://gw.alipayobjects.com/zos/antfincdn/XAosXuNZyF/BiazfanxmamNRoxxVxka.png', 2, NULL, 1, NULL, 1670494650.700);

-- --------------------------------------------------------

--
-- 表的结构 `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
CREATE TABLE IF NOT EXISTS `user_auth` (
  `id` char(8) NOT NULL COMMENT '主键',
  `identity` char(18) NOT NULL COMMENT '身份证号码',
  `auth_status` smallint NOT NULL DEFAULT '1' COMMENT '认证状态',
  `failure_reason` varchar(255) DEFAULT NULL COMMENT '失败原因',
  `submit_time` double(13,3) NOT NULL COMMENT '提交时间',
  `finished_time` double(13,3) NOT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='实名认证信息';

-- --------------------------------------------------------

--
-- 表的结构 `welfare`
--

DROP TABLE IF EXISTS `welfare`;
CREATE TABLE IF NOT EXISTS `welfare` (
  `id` char(8) NOT NULL COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `enable_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '启用状态',
  `create_time` double(13,3) NOT NULL COMMENT '创建时间',
  `update_time` double(13,3) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='福利信息';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
