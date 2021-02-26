---
title: 【第2篇博客】butterfly样式修改学习记录
date: 2021-02-09 10:31:23
updated: 2021-03-29 10:31:23
description: butterfly主题样式修改学习记录
tags: 
  - hexo
  - butterfly
---

## 博客首页图
default_top_img: /img/me.png # 进入博客首页显示的图
图片资源放进\themes\butterfly\source\img

## 导航菜单
在_config.yml
```yml
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

```yml
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
```yml
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
```yml
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
```md
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block center larger %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block right outline larger %}
```
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block center larger %}
{% btn 'https://butterfly.js.org/',Butterfly,far fa-hand-point-right,block right outline larger %}

## tabs
```md
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
```md
哪個英文字母最酷？ {% hideInline 因為西裝褲(C裝酷),查看答案,#FF7242,#fff %}

門裏站着一個人? {% hideInline 閃 %}
```
哪個英文字母最酷？ {% hideInline 因為西裝褲(C裝酷),查看答案,#FF7242,#fff %}

門裏站着一個人? {% hideInline 閃 %}

## 评论
在主题配置文件中设置
```yml
comments:
  # Up to two comments system, the first will be shown as default
  # Choose: Disqus/Disqusjs/Livere/Gitalk/Valine/Waline/Utterances/Facebook Comments/Twikoo
  use:
    - Valine
  text: true # Display the comment name next to the button
  # lazyload: The comment system will be load when comment element enters the browser's viewport.
  # If you set it to true, the comment count will be invalid
  lazyload: true
  count: true # Display comment count in top_img
  card_post_count: false # Display comment count in Home Page
```

其中，还需要配置Valine，需要用到leancloud。

它是领先的 BaaS 提供商,提供数据存储、文件存储、云引擎、容器、即时通讯、消息推送、短信、游戏云等多项服务,为移动开发提供强有力的后端支持。
valine: 参考 https://xuqwblog.blog.csdn.net/article/details/107248047

```yml
  appId:  # leancloud application app id
  appKey:  # leancloud application app key
  pageSize: 10 # comment list page size
  avatar: monsterid # gravatar style https://valine.js.org/#/avatar
  lang: en # i18n: zh-CN/zh-TW/en/ja
  placeholder: 記得留下你的暱稱和郵箱....可以快速收到回復 # valine comment input placeholder(like: Please leave your footprints )
  guest_info: nick,mail,link #valine comment header info (nick/mail/link)
  recordIP: false # Record reviewer IP
  serverURLs: # This configuration is suitable for domestic custom domain name users, overseas version will be automatically detected (no need to manually fill in)
  bg: /img/comment_bg.png # valine background
  emojiCDN: # emoji CDN
  enableQQ: false # enable the Nickname box to automatically get QQ Nickname and QQ Avatar
  requiredFields: nick,mail # required fields (nick/mail)
  option:
```

由于我们是静态博客，页面和存储是分离开的，动态博客才可以直接删除评论，因此需要用到LeanCloud，按下图进行删评。
![1jpg](1.jpg)

## 打字效果
```yml
activate_power_mode:
  enable: true
  colorful: true # open particle animation (冒光特效)
  shake: true #  open shake (抖动特效)
  mobile: false
```

## 背景特效
```yml
canvas_nest:
  enable: true
  color: '0,0,255' #color of lines, default: '0,0,0'; RGB values: (R,G,B).(note: use ',' to separate.)
  opacity: 0.7 # the opacity of line (0~1), default: 0.5.
  zIndex: -1 # z-index property of the background, default: -1.
  count: 99 # the number of lines, default: 99.
  mobile: false # false 手機端不顯示 true 手機端顯示
```

## 鼠标点击效果 
```yml
# Mouse click effects: Heart symbol (鼠標點擊效果: 愛心)
click_heart:
  enable: true
  mobile: false
```

## 网站副标题
```yml
# the subtitle on homepage (主頁subtitle)
subtitle:
  enable: true
  # Typewriter Effect (打字效果)
  effect: true
  # loop (循環打字)
  loop: true
  # source調用第三方服務
  # source: false 關閉調用
  # source: 1  調用搏天api的隨機語錄（簡體）
  # source: 2  調用一言網的一句話（簡體）
  # source: 3  調用一句網（簡體）
  # source: 4  調用今日詩詞（簡體）
  # subtitle 會先顯示 source , 再顯示 sub 的內容
  source: false
  # 如果有英文逗號' , ',請使用轉義字元 &#44;
  # 如果有英文雙引號' " ',請使用轉義字元 &quot;
  # 開頭不允許轉義字元，如需要，請把整個句子用雙引號包住
  # 如果關閉打字效果，subtitle只會顯示sub的第一行文字
  sub:
    - 不要以自己的放纵来对抗平庸
    - Never put off till tomorrow what you can do today
    - 你要悄悄的努力，然后惊艳所有人
```

## 字数统计
先`yarn add hexo-wordcount`
```yml
# wordcount (字數統計)
wordcount:
  enable: true
  post_wordcount: true
  min2read: true
  total_wordcount: true
```

## iconfont
国内最出名的莫过于iconfont,功能很强大且图标內容很丰富的矢量图标库。很多Font Awesome不支持的图标都可以在这里找到。同时，iconfont支持选择需要的图标生成css链接，減少不必要的CSS加载。

具体参考 https://butterfly.js.org/posts/4073eda/#iconfont

## 滚动条 
这里需要介绍一下JS/CSS 如何引用
1. 定位搜索 inject
2. 其中 head 是用来引入 css 的。bottom 是用来引入 js 的。
具体参考 https://www.antmoe.com/posts/a811d614/#%E5%89%8D%E7%BD%AE%E8%AF%B4%E6%98%8E

滚动条参考 https://www.antmoe.com/posts/a811d614/#%E6%BB%9A%E5%8A%A8%E6%9D%A1

## MAC 代码框美化
将 butterfly.yml 的 highlight_theme 配置项改为 mac 后任意引入 https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css

## 引入css/js文件
具体参考 https://butterfly.lete114.top/article/Butterfly-config.html
```yml
inject:
  head:
    - <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/iconfont.min.css">
    - <link rel="stylesheet" href="/css/20210205.css">
    - <link rel="stylesheet" href="/self/Kimbiedark.css">
    - <link rel="stylesheet" href="/css/background.css">
    - <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/sviptzk/StaticFile_HEXO@latest/butterfly/css/macblack.css">
  bottom:
    - <script src="https://cdn.jsdelivr.net/gh/sviptzk/HexoStaticFile@latest/Hexo/js/hideMobileSidebar.js"></script>
    - <script data-pjax src="/js/myjs.js"></script>
```

## 卖萌标题
```JS
// 可爱的Title
var OriginTitle = document.title;
var titleTime;
document.addEventListener('visibilitychange', function() {
    if (document.hidden) {
        $('[rel="icon"]').attr('href', "/img/favicon.ico");
        document.title = '(つェ⊂) 我藏好了哦~~';
        clearTimeout(titleTime);
    } else {
        $('[rel="icon"]').attr('href', "/img/favicon.ico");
        document.title = '(*´∇｀*) 被你发现啦~~' + OriginTitle;
        titleTime = setTimeout(function() {
            document.title = OriginTitle;
        }, 2000);
    }
});
```

## 博主昵称颜色
```CSS
.author-info__name {
    color: #ff7242;
}
```

## 鼠标魔改
具体参考 https://blog.csdn.net/u012208219/article/details/106883001/


## 页脚翻页时钟计时
具体参考 https://akilar.top/posts/b941af/

## 打赏按钮投币彩蛋效果
具体参考 https://akilar.top/posts/23fdf850/