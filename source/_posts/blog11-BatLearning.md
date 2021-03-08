---
title: 【第11篇博客】博客操作优化2——使用bat优化操作及bat语法学习记录
tags:
  - bat
  - 博客优化
categories:
  - 博客搭建记录
date: 2021-03-06 12:14:04
updated: 2021-03-06 12:14:04
description: 本文将介绍使用bat优化我们在博客准备、启动、提交时候的环境操作。
cover: https://gitee.com/tsuiwade/images/raw/1dc8850acfaa39e6f65919dbc21422500756b8a6/Green%20Fireflies%20Quotes%20Instagram%20Post.png
---

## 博客准备脚本

首先总结一下痛点，由于我们不再使用vscode编写markdown文章，开始使用Typora编写文章，于是当我们一开机，或者准备写博客的时候，首先打开文档文件夹，`C:\Users\tsui\blog\source\_posts`，然后再打开Typora软件和PicGo软件。于是，可以将打开文件夹、打开软件，继承为一个bat脚本。

![image-20210308203047265](https://gitee.com/tsuiwade/images/raw/master/image-20210308203047265.png)

因此在`C:\Users\tsui\blog\source\_posts`文件夹下新建文档文件，写下面代码：

```bat
start "" "C:\Users\tsui\blog\source\_posts"
tasklist | find /i "Typora.exe" && echo "Typora is running" || start "" "D:\Typora\Typora.exe"
start "" "D:\PicGo\PicGo.exe"
```

第一行为打开博客文件夹。

第二行为当运行了Typora时，则不执行；未执行Typora时，则运行Typora程序。（由于Typora可以多开，若不作此判断，则会多开；而PicGo软件则不会多开，因此无需判断。）

在批处理程序中检查指定进程是否在运行，然后根据其运行状态分别执行不同的命令。
语法：tasklist | find /i "程序" && 程序在运行执行命令1 || 不在运行执行命令2。
例子：tasklist | find /i "calc.exe" && taskkill /im calc.exe || echo 没有运行

第三行为运行PicGo程序。（至于为何与第二行不一样，倘若一样的情况下，PicGo若已经打开，则会报错。也欢迎大家帮我解答该问题。）

最后将该文件修改为`.bat`文件。

## 启动文件桌面魔改

1. 首先将刚刚的文件发送至桌面。

2. 在桌面上可以修改该文件名，甚至把后缀去掉。

   ![image-20210308203240590](https://gitee.com/tsuiwade/images/raw/master/image-20210308203240590.png)

3. 

   ![image-20210308203342929](https://gitee.com/tsuiwade/images/raw/master/image-20210308203342929.png)

   

修改结束，当点击该文件时，即可打开博客文件夹、打开Typora和PicGo随时等待你修改文章。

## 运行hexo脚本

同样在刚刚快接打开的博客文件夹中新建bat文件，命名为HexoRun。

```BAT
start  http://localhost:4000/
start "" "D:\PicGo\PicGo.exe"
tasklist | find /i "Typora.exe" && echo "Typora is running" || start "" "D:\Typora\Typora.exe"
cmd /k "cd /d C:\Users\tsui\blog&&hexo s"
```

第一行表示运行本地文件`localhost:4000`。无需先打开浏览器，这里我默认的浏览器为Chrome。

第二行、第三行表示启动Typora和PicGo程序。

第四行表示打开cmd指向hexo根目录，并执行命令，加&&。通过使用CD命令，并加入参数 /d ，可以通过一个步骤，直接进入指定盘符下的任意文件夹。

该脚本文件帮我们省了不少事哈。

## 博客提交脚本

主要是帮助我们git三连提交。

```bat
@echo off
cd /d C:\Users\tsui\blog
git add . 
git commit -m "bat push"
git push
```