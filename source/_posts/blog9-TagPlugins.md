---
title: 【第9篇博客】标签外挂的配置学习记录
date: 2021-02-07 22:04:18
updated: 2021-03-04 15:40:49
description: 
cover: "https://gitee.com/tsuiwade/images/raw/master/20210310123253.png"
tags: 
  - 标签外挂
  - github
categories: 
  - github
---



标签外挂主要使用了[Volantis](https://github.com/volantis-x/hexo-theme-volantis)的标签样式。引入[tag].js，并针对butterfly主题修改了相应的[tag].styl。

标签外挂是Hexo独有的功能，并不是标准的Markdown格式。以下的写法，只适用于butterfly主题，用在其他主题不会有效果。

## 配置教程
主要参考 https://akilar.top/posts/615e2dec/
点击下方github链接，并下载。
<p><a style="margin-inline:5px"target="_blank" href="https://github.com/Akilarlxh/Tag_Plugins"><img src="https://github-readme-stats.vercel.app/api/pin/?username=Akilarlxh&amp;repo=Tag_Plugins&amp;theme=vue&amp;show_owner=true" ></p>


2. 将下载的Tag_Plugins.zip解压得到butterfly文件夹。
3. 将butterfly文件夹复制到[Blogroot]\themes\目录下，覆盖当前的butterfly主题文件夹，提示重复则选择替换。(如果担心覆盖自己的其他魔改内容，可以根据静态文件内容自主比对修改)
4. 修改[Blogroot]\_config.butterfly.yml的inject配置项，添加CDN依赖项。由于issues写入timeline和site-card标签要用到jquery，请务必根据注释指示的版本决定是否添加。

```yml
inject:
  head:
    - <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/l-lin/font-awesome-animation/dist/font-awesome-animation.min.css"  media="defer" onload="this.media='all'">  #动画标签anima的依赖
  bottom:
    - <script defer src="https://cdn.jsdelivr.net/npm/jquery@latest/dist/jquery.min.js"></script>
    # 自butterfly_v3.4.0+开始，主题基本实现去jquery化，需要自己添加引用，请读者根据版本自行决定是否添加这行引用。
    - <script defer src="https://cdn.jsdelivr.net/npm/hexo-theme-volantis@latest/source/js/issues.min.js"></script>
    #数据集合标签issues的依赖
```
如果遇到问题，请hexo {% span red, clean、 %} {% span green, g、 %} {% span blue, s。 %}

接下来将介绍外挂标签使用语法。

## 行内文本样式

{% tabs 1, 2 %}
<!-- tab 标签语法-->
```markdown
{% u 文本内容 %}
{% emp 文本内容 %}
{% wavy 文本内容 %}
{% del 文本内容 %}
{% kbd 文本内容 %}
{% psw 文本内容 %}
```
<!-- endtab -->

<!-- tab 样式预览-->
1. 带 {% u 下划线 %} 的文本
2. 带 {% emp 着重号 %} 的文本
3. 带 {% wavy 波浪线 %} 的文本
4. 带 {% del 删除线 %} 的文本
5. 键盘样式的文本 {% kbd command %} + {% kbd D %}
6. 密码样式的文本：{% psw 这里没有验证码 %}
<!-- endtab -->

<!-- tab 示例源码-->
```md
1. 带 {% u 下划线 %} 的文本
2. 带 {% emp 着重号 %} 的文本
3. 带 {% wavy 波浪线 %} 的文本
4. 带 {% del 删除线 %} 的文本
5. 键盘样式的文本 {% kbd command %} + {% kbd D %}
6. 密码样式的文本：{% psw 这里没有验证码 %}
```
<!-- endtab -->
{% endtabs %}

## 行内文本 span

{% tabs 1, 2 %}
<!-- tab 标签语法-->
```markdown
{% span 样式参数(参数以空格划分), 文本内容 %}
```
<!-- endtab -->

<!-- tab 样式预览-->
- 彩色文字
在一段话中方便插入各种颜色的标签，包括：{% span red, 红色 %}、{% span yellow, 黄色 %}、{% span green, 绿色 %}、{% span cyan, 青色 %}、{% span blue, 蓝色 %}、{% span gray, 灰色 %}。
- 超大号文字
文档「开始」页面中的标题部分就是超大号文字。
{% span center logo large, Volantis %}
{% span center small, A Wonderful Theme for Hexo %}
<!-- endtab -->

<!-- tab 示例源码-->
```md
- 彩色文字
在一段话中方便插入各种颜色的标签，包括：{% span red, 红色 %}、{% span yellow, 黄色 %}、{% span green, 绿色 %}、{% span cyan, 青色 %}、{% span blue, 蓝色 %}、{% span gray, 灰色 %}。
- 超大号文字
文档「开始」页面中的标题部分就是超大号文字。
{% span center logo large, Volantis %}
{% span center small, A Wonderful Theme for Hexo %}
```
<!-- endtab -->
<!-- tab 配置参数-->
1. 字体: logo, code
2. 颜色: {% span red, red %},{% span yellow, yellow %},{% span green, green %},{% span blue, blue %},{% span cyan, cyan %},{% span gray, gray %}
3. 大小: small, h4, h3, h2, h1, large, huge, ultra
4. 对齐方向: left, center, right
<!-- endtab -->
{% endtabs %}


## 段落文本 p

{% tabs 1, 2 %}
<!-- tab 标签语法-->
```markdown
{% p 样式参数(参数以空格划分), 文本内容 %}
```
<!-- endtab -->

<!-- tab 样式预览-->
- 彩色文字
在一段话中方便插入各种颜色的标签，包括：{% p red, 红色 %}、{% p yellow, 黄色 %}、{% p green, 绿色 %}、{% p cyan, 青色 %}、{% p blue, 蓝色 %}、{% p gray, 灰色 %}。
- 超大号文字
文档「开始」页面中的标题部分就是超大号文字。
{% p center logo large, Volantis %}
{% p center small, A Wonderful Theme for Hexo %}
<!-- endtab -->

<!-- tab 示例源码-->
```md
- 彩色文字
在一段话中方便插入各种颜色的标签，包括：{% p red, 红色 %}、{% p yellow, 黄色 %}、{% p green, 绿色 %}、{% p cyan, 青色 %}、{% p blue, 蓝色 %}、{% p gray, 灰色 %}。
- 超大号文字
文档「开始」页面中的标题部分就是超大号文字。
{% p center logo large, Volantis %}
{% p center small, A Wonderful Theme for Hexo %}
```
<!-- endtab -->
<!-- tab 配置参数-->
1. 字体: logo, code
2. 颜色: {% span red, red %},{% span yellow, yellow %},{% span green, green %},{% span blue, blue %},{% span cyan, cyan %},{% span gray, gray %}
3. 大小: small, h4, h3, h2, h1, large, huge, ultra
4. 对齐方向: left, center, right
<!-- endtab -->
{% endtabs %}

## 引用 note

最新版butterfly标签支持引用fontawesome V5图标，效果上已经优于volantis的note标签。故不再额外引入volantis的note样式。

{% tabs 1, 4 %}
<!-- tab 通用配置-->
```yml
note:
  # Note tag style values:
  #  - simple    bs-callout old alert style. Default.
  #  - modern    bs-callout new (v2-v3) alert style.
  #  - flat      flat callout style with background, like on Mozilla or StackOverflow.
  #  - disabled  disable all CSS styles import of note tag.
  style: simple
  icons: false
  border_radius: 3
  # Offset lighter of background in % for modern and flat styles (modern: -12 | 12; flat: -18 | 6).
  # Offset also applied to label tag variables. This option can work with disabled note tag.
  light_bg_offset: 0
```
<!-- endtab -->

<!-- tab 语法格式-->
```md
{% note [class] [no-icon] [style] %}
Any content (support inline tags too.io).
{% endnote %}
```
或者 
```md
{% note [color] [icon] [style] %}
Any content (support inline tags too.io).
{% endnote %}
```
<!-- endtab -->

<!-- tab 配置参数-->
参数| 用法
:-|:-
class | 【可选】标识，不同的标识有不同的配色 </br>（ default / primary / success / info / warning / danger ）
no-icon | 【可选】不显示 icon
style | 【可选】可以覆盖配置中的 style </br>（simple/modern/flat/disabled）

或者 
参数| 用法
:-|:-
class | 【可选】标识，不同的标识有不同的配色 </br>（ default / primary / success / info / warning / danger ）
no-icon | 【可选】可配置自定义 icon (只支持 fontawesome 图标, 也可以配置 no-icon )
style | 【可选】可以覆盖配置中的 style </br>（simple/modern/flat/disabled）

<!-- endtab -->
<!-- tab 样式预览-->




1. `simple`样式

  {% note simple %}默认 提示块标签{% endnote %}

2. `modern`样式

  {% note modern %}默认 提示块标签{% endnote %}

  {% note default modern %}default 提示块标签{% endnote %}

  {% note primary modern %}primary 提示块标签{% endnote %}

  {% note success modern %}success 提示块标签{% endnote %}

  {% note info modern %}info 提示块标签{% endnote %}

  {% note warning modern %}warning 提示块标签{% endnote %}

  {% note danger modern %}danger 提示块标签{% endnote %}




<!-- endtab -->
<!-- tab 示例源码-->



<!-- endtab -->

{% endtabs %}




本文参考：
https://akilar.top/posts/615e2dec/
https://github.com/Akilarlxh/Tag_Plugins

![img](https://cdn.sspai.com/2019/05/24/1de13eae43785e27bbbcd631931fd161.png)