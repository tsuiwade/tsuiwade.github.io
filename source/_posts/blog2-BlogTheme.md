---
title: 【第2篇博客】butterfly样式修改学习记录
date: 2021-02-09 10:31:23
updated: 2021-03-29 10:31:23
description: butterfly主题样式修改学习记录
---

## 博客首页图
default_top_img: /img/me.png # 进入博客首页显示的图
图片资源放进\themes\butterfly\source\img

## 导航菜单
在_config.yml
```
menu:
  首页: / || fas fa-home
  时间轴: /archives/ || fas fa-archive
  标签: /tags/ || fas fa-tags
  分类: /categories/ || fas fa-folder-open
  友链: /link/ || fas fa-link
  关于: /about/ || fas fa-hear
```

必须是 /xxx/，后面||分开，然后写图标名。导航的文字可以自行修改。

## 社交图标
butterfly支持`font-awesome v5`图标。
书写格式 `图标名: url || 描述性文字`

```
social:
  fab fa-github: https://github.com/tsuiwade || Github
  fas fa-envelope: mailto:478451541@gmail.com || Email
  iconfont  icon-bilibili: https://space.bilibili.com/381957255 || bilibili
  iconfont  icon-zhifubao: https://www.bilibili.com || alipay
  iconfont  icon-wechat: https://www.bilibili.com || wechat
  iconfont  icon-qq: tencent://AddContact/?fromId=45&fromSubId=1&subcmd=all&uin=478451541 || qq
  iconfont  icon-csdn: https://www.bilibili.com || CSDN
  iconfont  icon-shejiao-yinle: https://www.bilibili.com || music
  iconfont  icon-shejiaotubiao-55: https://www.bilibili.com || facebook
```

https://blog.csdn.net/u012208219/article/details/106883012 
该教程描述了如何引入外部样式。

添加qq超链接 tencent://AddContact/?fromId=45&fromSubId=1&subcmd=all&uin=478451541
qq在线联系超链接http://wpa.qq.com/msgrd?v=3&uin=2445408174&site=qq&menu=yes


## 主页文章节选
主页文章的节选有自动节选和文章页description两种，
在主题配置文件中定位到
```
# Display the article introduction on homepage
# 1: description
# 2: both (if the description exists, it will show description, or show the auto_excerpt)
# 3: auto_excerpt (default)
# false: do not show the article introduction
index_post_content:
  method: 2
  length: 500 # if you set method to 2 or 3, the length need to config
```

在这我们选择2，优先选择description，如果没有配置description，则自动节选内容。

## 顶部图
`disable_top_img: true` ：不展示顶部图
`index_img`：主页的顶部图
`default_top_img`：默认的顶部图，当没有配置页面的顶部图的时候，将展示这个
`archive_img`：归档页的顶部图
`tag_img`：tag子页面的顶部图

还可尝试

    top_img: orange
    top_img: 'linear-gradient(20deg, #0062be, #925696, #cc426e, #fb0347)'


## 文章打赏
```
reward:
  enable: true
  QR_code:
    - img: /img/wechat.jpg
      #   link:
      text: 微信打赏
    - img: /img/alipay.jpg
      #   link:
      text: 支付宝打赏
```

## button
```
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block center larger %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block right outline larger %}
```
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block center larger %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block right outline larger %}

## tabs
```
{% tabs test1 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}
```
{% tabs test1 %}
<!-- tab -->
**This is Tab 1.**
<!-- endtab -->

<!-- tab -->
**This is Tab 2.**
<!-- endtab -->

<!-- tab -->
**This is Tab 3.**
<!-- endtab -->
{% endtabs %}

## tag-hide
```
哪個英文字母最酷？ {% hideInline 因為西裝褲(C裝酷),查看答案,#FF7242,#fff %}

門裏站着一個人? {% hideInline 閃 %}
```
哪個英文字母最酷？ {% hideInline 因為西裝褲(C裝酷),查看答案,#FF7242,#fff %}

門裏站着一個人? {% hideInline 閃 %}

## 评论


