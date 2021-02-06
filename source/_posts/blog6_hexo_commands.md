---
title: 【第六篇博客】hexo的常见指令及简写汇总
date: 2021-02-06 10:21:44
cover: 0.png
tags:
---

本文借鉴自https://hexo.io/zh-cn/docs/commands.html

为了方便查阅,这里汇总一些常用的hexo指令。

## 简写指令：

### init

`hexo init [folder]`
新建一个网站。如果没有设置 folder ，Hexo 默认在目前的文件夹建立网站。
该命令是一个缩写，完成如下步骤：
1、Git clone hexo-starter including hexo-theme-landscape into the current directory or a target folder if specified.
2、Install dependencies using a package manager: Yarn 1, pnpm or npm, whichever is installed; if there are more than one installed, the priority is as listed. npm is bundled with Node.js by default.

### new
`hexo new [layout] <title>`
新建一篇文章。如果没有设置 layout 的话，默认使用 _config.yml 中的 default_layout 参数代替。如果标题包含空格的话，请使用引号括起来。
`hexo n "我的第一篇文章"` 等价于 `hexo new "我的第一篇文章"` 还等价于 `hexo new post "我的第一篇文章"`

### generate
`hexo generate`
生成静态文件。(执行 $ hexo g后会在站点根目录下生成public文件夹, hexo会将"/blog/source/" 下面的.md后缀的文件编译为.html后缀的文件,存放在"/blog/public/ " 路径下)
该命令可以简写为
`hexo g`

### publish
`hexo publish [layout] <filename>`
发表草稿。
该命令可以简写为：
`hexo p`

### server
`hexo server`
启动服务器。Hexo 会监视文件变动并自动更新，除修改站点配置文件外，无须重启服务器，直接刷新网页即可生效。
默认情况下，访问网址为： http://localhost:4000/。
该命令可以简写为：
`hexo s`

### deploy
`hexo deploy`
部署网站。
该命令可以简写为：
`hexo d`