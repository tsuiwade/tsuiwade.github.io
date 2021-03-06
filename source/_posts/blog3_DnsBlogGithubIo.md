---
title: 【第3篇博客】如何在无外网情况下访问自己的github.io博客
cover: https://gitee.com/tsuiwade/images/raw/master/image-20210306235230035.png
date: 2020-10-10 10:55:12
updated: 2021-01-26 10:31:23
description: 在无外网情况下访问自己的博客
tags: 
  - hexo
  - github
categories: 
  - github
---

在没有科学上网的环境下，访问不了github.io个人博客，导致自己欣赏不了自己的博客。
于是，记录了配置dns来解决该问题的步骤。

本文借鉴自https://blog.csdn.net/qq_32627137/article/details/108046461

## 问题分析
在网络上访问网站，要首先通过DNS服务器把网络域名`www.XXXX.com` 解析成XXX.XXX.XXX.XXX的IP地址后，我们的计算机才能访问。要是对于每个域名请求我们都要等待域名服务器解析后返回IP信息，这样访问网络的效率就会降低，而Hosts文件就能提高解析效率。根据Windows系统规定，在进行DNS请求以前，Windows系统会先检查自己的Hosts文件中是否有这个地址映射关系，如果有则调用这个IP地址映射，如果没有再向已知的DNS服务器提出域名解析。也就是说Hosts的请求级别比DNS高。 

github的CDN被某墙屏了，由于网络代理商的原因，所以访问下载很慢。ping github.com 时，速度只有300多ms。
于是解决方案就是绕过dns解析，在本地直接绑定host，该方法也可加速其他因为CDN被屏蔽导致访问慢的网站。

## 根据环境情况选择跳转ip

由该网站进行查询https://tools.ipip.net/dns.php
如下图查看访问github.com域名时，延迟最低的ip，复制该ip

#### 该步骤的作用是选择可以访问到github.io的ip
![image-20210306235048605](https://gitee.com/tsuiwade/images/raw/master/image-20210306235048605.png)
然后管理员权限打开记事本

![image-20210306235112811](https://gitee.com/tsuiwade/images/raw/master/image-20210306235112811.png)

在记事本中打开C:\Windows\System32\drivers\etc路径下的hosts文件
该文件是域名解析文件。可以直接用记事本打开。将IP地址重定向。 
格式为：ip地址-空格-域名 
可以将一个域名重新定向到一个IP
通过它可以达到以下目的：1、加快域名解析；2、方便局域网用户；3、屏蔽网站 

![image-20210306235123450](C:\Users\tsui\AppData\Roaming\Typora\typora-user-images\image-20210306235123450.png)

在记事本的最后补上	
`219.141.136.10 github.com` 	
这时候可以打开cmd，输入`ping github.com`，可以看出ping通该网址了。

![image-20210306235142600](https://gitee.com/tsuiwade/images/raw/master/image-20210306235142600.png)

上一段是来自选中的跳转ip，下一段是来自己自己家原来的ip，可以看出用了跳转ip，速度会更快。

接下来同理，设置自己博客的tsuiwade.github.io的ip,接着补在记事本的最后。

![image-20210306235155495](https://gitee.com/tsuiwade/images/raw/master/image-20210306235155495.png)

最后就可以访问了。


