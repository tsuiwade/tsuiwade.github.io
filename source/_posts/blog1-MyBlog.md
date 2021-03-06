---
title: 【第1篇博客】hexo搭建github.io博客学习记录
date: 2020-07-05 10:30:44
updated: 2021-02-11 10:31:23
description: hexo搭建博客记录
cover: ![](https://gitee.com/tsuiwade/images/raw/master/6.png)
tags: 
  - hexo
categories: 
  - 博客搭建记录
---







github Pages可以被认为是用户编写的、托管在github上的静态网页。

本文将记录如下步骤：
1. 环境准备
2. hexo博客搭建
3. github静态网站部署
4. 通过github的Action自动部署项目

---
# 环境准备
## github账号申请及repository仓库新建
首先需要进入官网 https://github.com 申请一个github账号。

然后在右上角New一个repository，注意Repository name 必须为自己的`用户名.github.io`，例如 tsuiwade.github.io。（因为这样最后生成的博客网址才会足够的短，直接为`username.github.io`，否则生成的网址还有前面的用户名，网址过长而不美观。） 

![](https://gitee.com/tsuiwade/images/raw/master/1.jpg)

其他默认，最后`creat repository`

# hexo博客搭建
## 搭建静态博客的框架-hexo

hexo是一个快速、简洁且高效的博客框架，具有超快速度、支持markdown、一键部署、插件和可扩展性的特性。官网为 https://hexo.io/ 。

hexo框架的主题样式比较丰富，可用插件也较多，虽然功能不够强大，但仍然能满足现阶段我们写博客的需求，比较适合新手。

在搭建博客之前，最好有HTML/JS/CSS、Node/Npm、git/github的技能，不过没有也没关系，跟着我的这篇博客走，能完成自己博客的搭建，我的其他文章可以帮助你补全知识框架。

## 开始搭建hexo博客

初始化hexo将使用以下命令。
```
    npm install hexo-cli -g # 全局安装hexo提供的脚手架工具hexo-cli
    hexo init blog # 使用脚手架工具提供的hexo init来初始化一个hexo项目，后面填写项目名称
    cd blog # 项目初始化之后，进入项目文件夹，并且用vscode打开该文件夹
    npm install
    hexo server # 可简写为hexo s来运行项目，便可以在本地服务4000端口来访问
```

在浏览器中访问 http://localhost:4000 ，便可看到博客页面如下图所示，当前博客使用了hexo所提供的一个默认主题`landscape`，后续可以更换一个更好看的主题。
![](https://gitee.com/tsuiwade/images/raw/master/2.jpg)

我们回到项目文件夹中，主要文件的含义如下图所示。

![](https://gitee.com/tsuiwade/images/raw/master/3.png)

其中，根目录下的`_config.yml`文件是我们经常会修改的，可修改博客的一些默认配置。yml是一种用来表达数据序列化的格式，类似于json。

打开该文件，修改如下博客配置属性。

修改前   | 修改后 
:- | :- 
title: Hexo</br>description: ''</br>author: John Doe</br>language: en</br>url: http://example.com </br> | title: TsuiWade's blog</br>description: "记录技术生活的点点滴滴"</br>author: tsuiwade</br>language: zh-CN</br>url:https://tsuiwade.github.io/

修改后可以看到浏览器上的博客页面也做了相应的变化。

此时，一个基本的博客已经搭建完成。

## 修改主题样式

hexo官网 https://hexo.io/ 里提供了300多种主题样式，可以在跟随我使用同样的主题，学会设置主题样式后可自行选择任意一款你喜欢的样式来使用。
![](https://gitee.com/tsuiwade/images/raw/master/5.png)

这里我们选择`Butterfly`样式，同我的博客样式一样。

官网 https://butterfly.js.org/ 。 官网也做成了该主题的博客样式，使用的butterfly样式，其中有许多hexo博客优化教程，后续我也会学习整理。

还有github项目地址 https://github.com/jerryc127/hexo-theme-butterfly 。其中有配置主题的教程，我们先打开来走一遍该流程。

1、回到vscode，将该主题克隆到themes目录下。

输入
    
    git clone -b master https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
可以看到在themes文件夹下多了一个butterfly文件夹，即为主题样式文件。


2、在根目录的`_config.yml`中修改主题属性：
修改前   | 修改后 
:- | :- 
theme: landscape | theme: butterfly

3、在文件夹中显示butterfly，删除`.git`文件夹，删除该主题的默认的git配置文件，是为了把该主题和我们的博客项目合并为一个项目，统一由一个git来管理。

4、更换主题后，如果输入hexo s，则会看到Hexo启动服务器页面显示报错extends includes/layout.pug block content include includes/recent-posts.pug include

此时我们在cmd中输入

    npm install --save hexo-renderer-jade hexo-generator-feed hexo-generator-sitemap hexo-browsersync hexo-generator-archive

此时`hexo s`即可看到主题样式应用成功。

倘若还不能解决，则进行清除缓存
`hexo clean`
生成静态文件，查看效果
`hexo g`
`hexo s`
可看到主题样式配置生效。

![](https://gitee.com/tsuiwade/images/raw/master/3.jpg)


# github静态网站部署
此时，我们的博客只能在本地访问。接下来我们需要把博客部署到github上的一个仓库上，然后使用github pages功能，获取到一个站点来访问我们的博客。

由前面的github账号创建的仓库。打开该github页面，正如页面提示的一样。
![](https://gitee.com/tsuiwade/images/raw/master/4.jpg)

首先进行·git初始化：

    git init

然后给当前仓库添加一个远程的git地址：

    git remote add origin https://github.com/miemietou/miemietou.github.io.git

在使用hexo部署博客之前，我们需要先安装一个叫`hexo-deployer-git`的依赖，这个库会帮助我们将生成好的代码部署到一个具体的分支。

    yarn add hexo-deployer-git

安装完之后，我们打开`_config.yml`文件，拉到最下面，修改deploy属性。部署类型为git，仓库地址填项目地址，分支填写master，注意我们的打包产物需要提交到master分支。
将

    deploy:
      type: ''
修改为

    deploy:
      type: git
      repo: https://github.com/miemietou/miemietou.github.io
      branch: master

接着输入

    hexo deploy

来部署我们的代码，代码提交完成之后，我们打开github项目的首页，就能看到我们打包上传的产物已经提交到了master分支上。master分支里面的代码其实就是生成的public目录下的文件。然后点击仓库页面的setting，找到github pages一栏，顺利的话将显示我们的站点已成功部署，可以打开该网址检查是否被部署成功。

此时我们已经完成一个博客的基本部署功能。接下来将做一个非常有趣的自动化部署功能。

在自动化部署之前，我们需要把我们的源代码提交到github上，因为master分支已经被占用，所以我们只能把源代码提交到另一个分支上，首先我们需要commit一下本地代码。

    git add .
    git commit -m "none"

然后我们重建一个分支myblog，然后将该分支push到github上。

    git push --set-upstream origin myblog

接着，myblog分支已经被push到了github上。

# github actions实现自动化部署
不需要自己在本地进行代码的构建打包，使仓库的action功能，点击该按钮，可以看到github actions提供的功能：帮助构建、测试、部署你的代码，还能使用github actions来做code review、分支管理和issue的追踪。我们这里将会使用它来实现项目的自动打包和代码的部署。

首先，我们需要在项目根目录下创建.github文件夹和.github目录下的workflows文件夹，然后在里面新建deploy.yml文件，复制粘贴如下代码，该代码的作用就是配置代码部署过程中的一些步骤，例如第一步需要checkout，然后需要安装和打包构建，最后触发一个代码的部署。

    name: Build and Deploy
    on: [push]
    jobs:
    build-and-deploy:
        runs-on: ubuntu-latest
        steps:
        - name: Checkout 🛎️
            uses: actions/checkout@v2 # If you're using actions/checkout@v2 you must set persist-credentials to false in most cases for the deployment to work correctly.
            with:
            persist-credentials: false
        - name: Install and Build 🔧 # This example project is built using npm and outputs the result to the 'build' folder. Replace with the commands required to build your project, or remove this step entirely if your site is pre-built.
            run: |
            npm install
            npm run build
            env:
            CI: false
        - name: Deploy 🚀
            uses: JamesIves/github-pages-deploy-action@releases/v3
            with:
            GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
            BRANCH: master # The branch the action should deploy to.
            FOLDER: public # The folder the action should deploy.

接下来，就输入提交代码老三行：
    git add .
    git commit -m "message"
    git push

提交之后，我们回到仓库首页，点击actions标签，可以看到所有的工作流，如果显示绿色打钩则代码部署成功，站点内容就会成功更新。


参考： https://www.bilibili.com/video/BV1dt4y1Q7UE?t=354

https://www.antmoe.com/posts/4b1b8c9f/