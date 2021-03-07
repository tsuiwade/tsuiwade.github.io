---
title: 【第12篇博客】PicGo图床工具配合Typora的便捷贴图配置
tags:
  - PicGo
  - Typora
  - Gitee
categories:
  - 博客搭建记录
date: 2021-03-06 16:57:32
updated: 2021-03-06 16:57:32
description: 本文将介绍如何配置PicGo图床工具+gitee码云，配合Typora来便捷贴图。
cover: https://gitee.com/tsuiwade/images/raw/master/512133.jpg
---

PicGo官网地址 [https://molunerfinn.com/PicGo/](https://link.zhihu.com/?target=https%3A//molunerfinn.com/PicGo/)

在GitHub项目地址 [https://github.com/Molunerfinn/PicGo](https://link.zhihu.com/?target=https%3A//github.com/Molunerfinn/PicGo)

PicGo文档地址 [https://picgo.github.io/PicGo-Doc/zh/guide/#应用概述](https://link.zhihu.com/?target=https%3A//picgo.github.io/PicGo-Doc/zh/guide/%23%E5%BA%94%E7%94%A8%E6%A6%82%E8%BF%B0)

---

在前文介绍了Tpora写markdown博客的操作，然而在贴图方面还是不够便捷，这里介绍一种PicGo配合的方法来便捷贴图。

> 所谓图床工具，就是专门用来存放图片，同时允许你把图片对外连接的网上空间，不少图床都是免费的。设置图床后，在博客中插入的图片链接就可以随时随地在线预览。网络上有很多图床工具，就目前使用种类而言，PicGo 算得上一款比较优秀的图床工具。它是一款用 `Electron-vue` 开发的软件，可以支持微博，七牛云，腾讯云COS，又拍云，GitHub，阿里云OSS，SM.MS，imgur 等8种常用图床，功能强大，简单易用。

## 下载Picgo

首先进入github下载，https://github.com/Molunerfinn/PicGo/releases

注意：*mac* 系统选择 *dmg* 下载，*windwos* 选择 *.exe*系统，如果不是下载安装包，想看源码的话，可以选择 `git clone https://github.com/Molunerfinn/PicGo.git` 克隆到本地

![image-20210307130020168](https://gitee.com/tsuiwade/images/raw/master/image-20210307130020168.png)

安装成功界面：

![image-20210307130215796](https://gitee.com/tsuiwade/images/raw/master/image-20210307130215796.png)



## 安装gitee插件

找到底下插件设置，使用码云需要另外安装插件，搜索gitee安装插件，下载第一个：

![image-20210307130739301](https://gitee.com/tsuiwade/images/raw/master/image-20210307130739301.png)

注意：安装`gitee-uploader 1.1.2`插件，必须要先安装`node.js`才能安装插件。

也可以采用手动安装：

![image-20210307161112397](https://gitee.com/tsuiwade/images/raw/master/image-20210307161112397.png)



## 创建gitee仓库

新建gitee账号这里就不赘述了。

建立gitee码云图床库，就是在码云新建一个仓库，步骤：

![image-20210307131125647](https://gitee.com/tsuiwade/images/raw/master/image-20210307131125647.png)

## Gitee生成私人令牌token

![image-20210307160818893](https://gitee.com/tsuiwade/images/raw/master/image-20210307160818893.png)

![image-20210307161009440](https://gitee.com/tsuiwade/images/raw/master/image-20210307161009440.png)

## PicGo的gitee图床设置

点击左侧图床设置——gitee图床，设置如下：

![image-20210307162023734](https://gitee.com/tsuiwade/images/raw/master/image-20210307162023734.png)

注意，这里的owner和repo名字，如果设置不对，后期出现问题记得查这里的问题。下图即是我第一次设置错的配置，请看我的仓库地址，此时的owner应该是xxxxxxxxxxw，repo名应该是blog-img。

![image-20210307162148857](https://gitee.com/tsuiwade/images/raw/master/image-20210307162148857.png)

而且还需要注意名称对应的问题，如下图，即使我在repo位置填写的是BlogImg，但被解析成blog-img，此处需要注意。

![image-20210307162543953](https://gitee.com/tsuiwade/images/raw/master/image-20210307162543953.png)

## PicGo设置

![image-20210307163418777](https://gitee.com/tsuiwade/images/raw/master/image-20210307163418777.png)

请注意此处的Server监听地址和监听端口。

![image-20210307163526827](https://gitee.com/tsuiwade/images/raw/master/image-20210307163526827.png)

## Typora配置

![img](https://gitee.com/tsuiwade/images/raw/master/image-20200323201738802.png)

## 最终效果

可在码云仓库内查看上传的图片。

![image-20210307175745968](https://gitee.com/tsuiwade/images/raw/master/image-20210307175745968.png)

## 使用方法

1. 直接复制图片，粘贴至Typora，便会自动生成链接，非常方便。
2. 将图片文件拖进PicGo上传区，也会自动生成markdown链接。
3. PicGo上传区剪贴板图片，直接复制图片，点击`剪贴板图片`，即可获取markdown链接。



