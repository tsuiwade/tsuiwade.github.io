---
title: 【第11篇博客】博客操作优化2——使用bat优化操作及bat语法学习记录
tags:
  - bat
  - 博客优化
categories:
  - 博客搭建记录
date: 2021-03-06 12:14:04
updated: 2021-03-06 12:14:04
description: 本文将介绍使用bat优化我们在博客准备、启动、提交时候的环境操作，还将介绍一些bat语法。
cover: https://gitee.com/tsuiwade/images/raw/1dc8850acfaa39e6f65919dbc21422500756b8a6/Green%20Fireflies%20Quotes%20Instagram%20Post.png
---

## 博客启动

首先总结一下痛点，由于我们不再使用vscode编写markdown文章，开始使用Typora编写文章，于是当我们一开机，或者准备写博客的时候，



在批处理程序中检查指定进程是否在运行，然后根据其运行状态分别执行不同的命令

语法：tasklist | find /i "程序" && 程序在运行执行命令1 || 不在运行执行命令2

例子：tasklist | find /i "calc.exe" && taskkill /im calc.exe || echo 没有运行
