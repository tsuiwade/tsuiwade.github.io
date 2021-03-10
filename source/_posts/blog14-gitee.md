---
title: 【第14篇博客】gitee博客的尝试
tags:
  - gitee
categories:
  - 博客搭建记录
date: 2021-03-09 20:43:52
updated: 2021-03-09 20:43:52
description: 我们一直在用github pages，想尝试一下gitee码云博客。
cover: https://gitee.com/tsuiwade/images/raw/master/20210310094946.png
---

本文将介绍如何单一使用gitee博客，后面会考虑介绍多线部署多个博客。

## 新建gitee仓库

尽量仓库名称与用户名保持一致。

![image-20210310095306299](https://gitee.com/tsuiwade/images/raw/master/image-20210310095306299.png)

## hexo配置文件修改

复制URL，到hexo的配置文件`_config.yml`

```yml
url: https://tsuiwade.gitee.io/
```

```yml
deploy:
  type: git
  repo: https://gitee.com/tsuiwade/tsuiwade
  branch: master
```

## gitee部署

接下来在根目录输入`hexo d`进行部署，然后如图，输入自己的信息。

![image-20210310100652160](https://gitee.com/tsuiwade/images/raw/master/image-20210310100652160.png)

## gitee设置

部署完可以回到gitee仓库上看看：

![image-20210310100849780](https://gitee.com/tsuiwade/images/raw/master/image-20210310100849780.png)

此时gitee仓库上已经有了内容，再点击服务——pages：

![image-20210310100930745](https://gitee.com/tsuiwade/images/raw/master/image-20210310100930745.png)

在master分支下，点击更新，等待部署完即可访问自己的网址。[https://tsuiwade.gitee.io](https://tsuiwade.gitee.io/)

![image-20210310101015487](https://gitee.com/tsuiwade/images/raw/master/image-20210310101015487.png)

## 如何更新部署

gitee并不像github可以自动化部署，不可通过git add . && git commit .. && git push三连提交代码。。

而是必须hexo cl && hexo g && hexo d来提交代码。

请注意，必须先hexo cl 。

此时网站已经搭建好了，访问速度也快许多。