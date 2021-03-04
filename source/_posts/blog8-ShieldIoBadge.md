---
title: 【第8篇博客】GitHub Badge的配置学习记录
date: 2021-02-04 22:04:18
updated: 2021-03-04 15:40:49
description: 
cover: 
tags: 
  - shield.io
  - GitHub Badge
categories: 
  - github
---





效果如下：
![p62](https://cdn.imzjw.cn/img/62)
大家平时在逛GitHub，Gitee，各大论坛博客的时候，都有类似很好看很漂亮的徽章，主要通过 [shields.io](https://shields.io/) 在线生成。

![p63](https://cdn.imzjw.cn/img/63)

其中，找到Your BADGE 专属定制徽章
- label：标签，徽标左侧内容
- message：信息，徽标右侧内容
- color：色值，支持支持十六进制、rgb、rgba、hsl、hsla 和 css 命名颜色。十六进制记得删除前面的 # 号

输入相关信息后，点击 make badge 即可得到徽标的 URL。可以用 img 标签引用

在主题配置文件中的`footer`:  `copyright: `设置为false、`footer`:  `custom_text: `中填写
```html
<p><a style="margin-inline:5px"target="_blank" href="https://hexo.io/"><img src="https://img.shields.io/badge/Frame-Hexo-blue?style=flat&logo=hexo" title="博客框架为 Hexo" alt="HEXO"></a><a style="margin-inline:5px"target="_blank" href="https://butterfly.js.org/"><img src="https://img.shields.io/badge/Theme-Butterfly-6513df?style=flat&logo=bitdefender" title="主题采用 Butterfly" alt="Butterfly"></a><a style="margin-inline:5px"target="_blank" href="https://www.jsdelivr.com/"><img src="https://img.shields.io/badge/CDN-jsDelivr-orange?style=flat&logo=jsDelivr" title="本站使用 Jsdelivr 为静态资源提供CDN加速" alt="Jsdelivr"></a><a style="margin-inline:5px"target="_blank" href="https://github.com/"><img src="https://img.shields.io/badge/Source-Github-d021d6?style=flat&logo=GitHub" title="本站项目由 GitHub 托管" alt="GitHub"></a><a style="margin-inline:5px"target="_blank"href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img src="https://img.shields.io/badge/Copyright-BY--NC--SA%204.0-d42328?style=flat&logo=Claris" alt="img" title="本站采用知识共享署名-非商业性使用-相同方式共享4.0国际许可协议进行许可"></a></p>
```
可以发现，简单定制小牌子非常方便，最最基础的语法规则就是：
`https://img.shields.io/badge/{左半部分标签}-{右半部分标签}-{右半部分颜色}`
还可以贴在markdown文档中。