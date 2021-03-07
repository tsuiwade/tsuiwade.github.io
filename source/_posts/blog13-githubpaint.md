---
title: 【第13篇博客】github贡献日历上画画及博客首页显示gitcalendar
tags:
  - github
  - gitcalendar
categories:
  - 博客搭建记录
date: 2021-03-07 22:36:44
updated: 2021-03-07 22:36:44
description: 本文将介绍如何修改github首页的贡献日历上的图案，以及如何在博客首页显示该图案。
cover: https://gitee.com/tsuiwade/images/raw/master/20210308010643.png
---

## gitcalendar魔改效果

由于我是新人，号是新号，github贡献日历基本都挤在右边，看上去确实囊中羞涩、乏善可陈，于是想为加上一些图案，正好看到前人有过类似魔改记录，于是重新走了一遍，首先先来看一下效果。

github首页效果：

![image-20210308010618267](https://gitee.com/tsuiwade/images/raw/master/image-20210308010618267.png)

博客首页效果：

![image-20210308010559971](https://gitee.com/tsuiwade/images/raw/master/image-20210308010559971.png)

## github图案绘制

1. 首先感谢[qinshuang1998](https://github.com/qinshuang1998)大神的开源项目[GithubPainter](https://github.com/qinshuang1998/GithubPainter) ，在本地新建一个空文件夹，例如我在桌面上打开`git bash here`。下载该项目，得到如下图文件。

   ```git
   git clone https://github.com/qinshuang1998/GithubPainter.git  
   ```

   ![image-20210308002030166](https://gitee.com/tsuiwade/images/raw/master/image-20210308002030166.png)

2. 打开文件`./designer/index.html`，这一个用html写的designer设计器，打开后会生成一个和Github一模一样的贡献板，你可以通过在上面点击鼠标来控制格子的颜色，进行绘制图案，如我选择的图案。

   注意，应先选择结束日期，在自己的github首页上看看最后一天对应哪天，再选择开始日期，也需要在github贡献日历上看看左上角是哪天，对应起来。

   接着进行绘制图案，如我选择的图案，点击一下是最浅色，多点击则变深，请各位耐心绘制自己喜欢的图案。

   ![image-20210308010536931](https://gitee.com/tsuiwade/images/raw/master/image-20210308010536931.png)

3. 图案绘制完毕，导出为map.qs文件，替换上图路径下的同名文件。

   

## github仓库创建

在github上创建新仓库，我命名为`githubpaint`。

![image-20210308005534216](https://gitee.com/tsuiwade/images/raw/master/image-20210308005534216.png)

然后在刚刚`C:\Users\tsui\Desktop\GithubPainter-master\GithubPainter-master`路径下打开`git bash`，将自己的`githubpaint`项目clone下来：

```git
git clone git@github.com:tsuiwade/githubpaint.git
```

![image-20210308005921760](https://gitee.com/tsuiwade/images/raw/master/image-20210308005921760.png)

因此在`C:\Users\tsui\Desktop\GithubPainter-master\GithubPainter-master`路径下生成了`githubpaint`文件夹。

## commit脚本

接着执行python文件，用commit.py的python脚本读取它，并对本地的Git仓库进行commit操作就好了（脚本中的文件路径等参数需要自己改动，包括本地仓库文件githubpaint和图案文件）。

```python
    repo = Repo('./githubpaint')
```

注意，这里的`git`模块是`GitPython`模块，通过`pip install gitpython`或`conda install gitpython`进行安装。GitPython块python用来封装git操作的模块，主要用来替代gitbash的操作。

不报错运行完即是成功运行。

## git push提交

运行完成后将你的本地仓库push即可，在本地仓库githubpaint路径下git push，就可大功告成了。此时查看你的github首页，就不那么囊中羞涩、乏善可陈，反而有趣新奇，甚好甚好。

![image-20210308004353339](https://gitee.com/tsuiwade/images/raw/master/image-20210308004353339.png)



## hexo-github-calendar使用

一键部署：

```
npm i hexo-githubcalendar --save
```

网站根目录_config配置项(不是主题的)： 例如butterfly配置为

```yml
# Ice Kano Plus_in
# Hexo Github Canlendar
# Author: Ice Kano
# Modify: Lete乐特

# butterfly
githubcalendar:
  enable: true
  enable_page: /
  user: zfour
  layout:
    type: id
    name: recent-posts
    index: 0
  githubcalendar_html: '<div class="recent-post-item" style="width:100%;height:auto;padding:10px;"><div id="github_loading" style="width:10%;height:100%;margin:0 auto;display: block"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  viewBox="0 0 50 50" style="enable-background:new 0 0 50 50" xml:space="preserve"><path fill="#d0d0d0" d="M25.251,6.461c-10.318,0-18.683,8.365-18.683,18.683h4.068c0-8.071,6.543-14.615,14.615-14.615V6.461z" transform="rotate(275.098 25 25)"><animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0 25 25" to="360 25 25" dur="0.6s" repeatCount="indefinite"></animateTransform></path></svg></div><div id="github_container"></div></div>'
  pc_minheight: 280px
  mobile_minheight: 0px
  color: "['#ebedf0', '#fdcdec', '#fc9bd9', '#fa6ac5', '#f838b2', '#f5089f', '#c4067e', '#92055e', '#540336', '#48022f', '#30021f']"
  api: https://python-github-calendar-api.vercel.app/api
  # api: https://python-gitee-calendar-api.vercel.app/api
  calendar_js: https://cdn.jsdelivr.net/gh/Zfour/hexo-github-calendar@1.21/hexo_githubcalendar.js
  plus_style: ""
```

执行：

```cmd
hexo clean & hexo g & hexo s
```

就可以看到效果了！

## 可能出现的bug

之前可能在自己的电脑上登陆过别人的号，所以本地的git账号不是自己的，因此commit上并不能计算成自己的贡献。

![image-20210308004047420](https://gitee.com/tsuiwade/images/raw/master/image-20210308004047420.png)

于是查看了本地git账号，果然不是自己的，修改成自己的账号即可。具体可看[如何在vscode修改git 的账号和邮箱](https://www.cnblogs.com/bbldhf/p/13269577.html) 。

![image-20210308004246316](https://gitee.com/tsuiwade/images/raw/master/image-20210308004246316.png)









主要参考 https://segmentfault.com/a/1190000022736595