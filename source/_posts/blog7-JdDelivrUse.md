---
title: 【第7篇博客】配置jsDelivr提供静态资源CDN加速学习记录
date: 2021-02-01 15:40:49
updated: 2021-03-04 15:40:49
description: jsDelivr提供静态资源CDN加速是个什么东西？
cover: "https://cdn.imzjw.cn/img/44"
tags: 
  - jeDelivr
  - CDN
categories: 
  - 博客搭建记录
---

在之前第二篇主题样式修改的学习记录里，就出现过很多引用jsdelivr的链接，一直不知道这是做什么用的，今天就来`学习`、`记录`、`配置`一下jsdelivr。

> `CDN`的全称是Content Delivery Network，即内容分发网络。CDN是构建在现有网络基础之上的智能虚拟网络，依靠部署在各地的边缘服务器，通过中心平台的负载均衡、内容分发、调度等功能模块，使用户就近获取所需内容，降低网络拥塞，提高用户访问响应速度和命中率。CDN的关键技术主要有内容存储和分发技术。——百度百科

放在Github的资源在国内加载速度比较慢，因此需要使用CDN加速来优化网站打开速度，jsDelivr + Github便是免费且好用的CDN，非常适合博客网站使用。

`jsDelivr` https://www.jsdelivr.com/ 是一个CDN服务提供商，优点在于全球通用。专门提供js相关的CDN，对npm,github做了加速镜像。针对npm, github提供了CDN镜像。
![p1](https://cdn.imzjw.cn/img/45)

接下来，将介绍如何将自己的字体文件上传jsDelivr。

## 新建github仓库
在此，仓库名设置为CDN。
![p2](https://cdn.imzjw.cn/img/46)

## 克隆github仓库到本地
    git clone git@github.com:tsuiwade/CDN.git
![p3](https://cdn.imzjw.cn/img/47)
在vscode的cmd中输入代码，倘若出现如下的报错，是因为客户端与服务端未生成 ssh key，为解决以上问题，我们需要重新生成一次ssh key ，并重新配置一下GitHub账户即可。具体参考 https://blog.csdn.net/weixin_40922744/article/details/107576748
（其中，解决方法里面的cmd窗口是Git bash。）
![p4](https://cdn.imzjw.cn/img/48)
如果出现ssh无效问题 参考 https://blog.csdn.net/weixin_45604257/article/details/106649576

## 上传资源
将需要上传的资源放进本地CDN仓库中。
![p5](https://cdn.imzjw.cn/img/49)
（注：jsDelivr不支持加载超过20M的资源），在本地git仓库目录下右键 Git Bash Here，执行以下命令：
```git
git status                    //查看状态
git add .                     //添加所有文件到暂存区
git commit -m '第一次提交'      //把文件提交到仓库
git push                      //推送至远程仓库
```

## 发布仓库
回到github上，点击release发布，填写必要信息如下图所示。
![p6](https://cdn.imzjw.cn/img/50)

这就设置完成了，接下来可以引用资源了。

## 通过jsDelivr引用资源
`使用方法：https://cdn.jsdelivr.net/gh/你的用户名/你的仓库名@发布的版本号/文件路径`
例如：
https://cdn.jsdelivr.net/gh/tsuiwade/CDN@4.0/font/yenianti.otf

这里就大功告成了，这里引用的字体，可以参考第二篇博客的首页字体修改。

本文主要参考 https://blog.csdn.net/qq_36759224/article/details/86936453



https://github.com/badges/shields
https://github.com/spencerwooo/Substats
https://sspai.com/post/59593
https://www.cnblogs.com/sddai/p/13779316.html
https://shields.io/
https://www.baidu.com/s?wd=https%3A%2F%2Fshields.io%2F&pn=10&oq=https%3A%2F%2Fshields.io%2F&ie=utf-8&rsv_pq=bf92913f0003488b&rsv_t=d46aUVHAFQ77ZmEGMpHpwQ5ncdiMRCwA4exwuw8jxTdXvT1%2BpwCVWcKKgec&rsv_jmp=slow