---
title: 【第一篇博客】hexo搭建github.io博客学习记录
date: 2020-07-05 10:30:44
tags:
---

github Pages可以被认为是用户编写的、托管在github上的静态网页。

本文将记录如下步骤：
1. 环境搭建
2. hexo博客搭建
3. github静态网站部署
4. 通过github的Action自动部署项目


## github账号申请及repository仓库新建
首先需要进入官网 https://github.com 申请一个github账号。

然后在右上角New一个repository，注意Repository name 必须为自己的`用户名.github.io`，例如 tsuiwade.github.io。（因为这样最后生成的博客网址才会足够的短，直接为`username.github.io`，否则生成的网址还有前面的用户名，网址过长而不美观。）
![1jpg](1.jpg)
其他默认，最后`creat repository`

## 搭建静态博客的框架-hexo
hexo框架的主题样式比较丰富，可用插件也较多，虽然功能不够强大，但仍然能满足现阶段我们写博客的需求，比较适合新手。

hexo是一个快速、简洁且高效的博客框架。
在搭建博客之前，最好有HTML JS CSS、Node Npm、git github的技能，不过没有也没关系，跟着我的这篇博客走，能完成自己博客的搭建，我的其他文章可以帮助你补全知识框架。

## 开始搭建hexo博客

```
    npm install hexo-cli -g # 全局安装hexo提供的脚手架工具hexo-cli
    hexo init blog # 使用脚手架工具提供的hexo init来初始化一个hexo项目，后面填写项目名称
    cd blog # 项目初始化之后，进入项目文件夹，并且用vscode打开该文件夹
    npm install
    hexo server # 可简写为hexo s来运行项目，便可以在本地服务4000端口来访问
```

在浏览器中访问 http://localhost:4000 ，便可看到博客页面如下图所示，当前博客使用了hexo所提供的一个默认主题`landscape`，后续可以更换一个更好看的主题。
![2jpg](2.jpg)

其中，项目中的主要文件的含义如下图所示。
![3png](3.png)

其中，根目录下的`_config.yml`文件是我们经常会修改的，可修改博客的一些默认配置。yml是一种用来表达数据序列化的格式，类似于json。

打开该文件，修改如下博客配置。

修改前   | 修改后 
:- | :- 
title: Hexo</br>description: ''</br>author: John Doe</br>language: en</br>url: http://example.com </br> | title: TsuiWade's blog</br>description: "记录技术生活的点点滴滴"</br>author: tsuiwade</br>language: zh-CN</br>url:https://tsuiwade.github.io/

修改后可以看到浏览器上的博客页面也做了相应的变化。

此时，一个基本的博客已经搭建完成。

## 修改主题样式

hexo官网里

## 博客部署到github上

## github actions实现自动化部署
不需要自己在本地进行代码的构建打包

参考： https://www.bilibili.com/video/BV1dt4y1Q7UE?t=354

