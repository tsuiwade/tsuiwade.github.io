---
title: 【第5篇博客】hexo下的markdown的语法(GFM)学习记录
cover: 0.jfif
date: 2021-01-02 11:31:14
updated: 2021-01-26 10:31:23
tags: 
  - GFM
  - markdown
categories: 
  - github
---
Hexo下使用的MarkDown为Github的GFM，GFM（Github Flavored Markdown）是 Github 拓展的基于 Markdown 的一种纯文本的书写格式。风格很漂亮，简洁美观大方。但是GFM的MarkDown语法和标准的MarkDown稍有不同，使用过程中需要注意一些。

# 1、标题
Markdown 中，使用 # 或 = 来定义大纲标题，有多少个#或=，就表示是几级的大纲，相当于<h几>。

语法   | 效果 
:-: | :-: 
\# 一级标题 | <h1>一级标题</h1>
\#\# 二级标题 | <h2>二级标题</h2>
\#\#\# 三级标题 | <h3>三级标题</h3>
\#\#\#\# 四级标题 | <h4>四级标题</h4>
正常文字 | 正常文字
\#\#\#\#\# 五级标题 | <h5>五级标题</h5>
\#\#\#\#\#\# 六级标题 | <h6>六级标题</h6>



# 2、基本字体样式
Markdown 使用一个星号表示斜体，两个星号表示加粗，三个星号表示加粗斜体。

语法   | 效果 
:-: | :-: 
\*斜体*  |  *斜体*
\*\*粗体** 或 \_\_粗体__ | **粗体** 
\*\*\*加粗斜体*** |***加粗斜体***
\~\~删除线~~ | ~~删除线~~

# 3、列表
使用星号或者中横线来表示无序列表，注意后面需要加个空格。
```
* 无序列表1
* 无序列表2
- 无序列表3
- 无序列表4
1. 有序列表1
2. 有序列表2
```
* 无序列表1
* 无序列表2
- 无序列表3
- 无序列表4
1. 有序列表1
2. 有序列表2

# 4、引用
引用部分的内容只需要在行首加上 > 就可以了。
```
> 沃兹基硕德说过：不要以自己的放纵来对抗平庸

> 动物
>> 水生动物
>> 陆生动物
>>> 猴子
>>> 人
>>>> 程序猿
>>>> 攻城狮
>>产品狗 //这里需要注意，没有空行间隔，忽略降级引用标记
射鸡虱   //这里需要注意，没有空行间隔，忽略降级引用标记
```
> 沃兹基硕德说过：不要以自己的放纵来对抗平庸

> 动物
>> 水生动物
>> 陆生动物
>>> 猴子
>>> 人
>>>> 程序猿
>>>> 攻城狮
>>产品狗 //这里需要注意，没有空行间隔，忽略降级引用标记
射鸡虱   //这里需要注意，没有空行间隔，忽略降级引用标记

# 5、超链接
Markdown 使用`[]()`来表示超链接，中括号表示链接文字，小括号表示链接地址。

    [tsuiwade's blog](tsuiwade.github.io)
[tsuiwade's blog](tsuiwade.github.io)

# 6、图片
图片的样式与超链接非常相似，只需在前面加个感叹号就可以了，即用`![]()`表示图片。其中中括号表示图片未加载时的提示文字，小括号表示图片地址。
例如使用hexo n blog7_MarkdownLearning时创建了`blog7-MarkdownLearning.md`和`blog7-MarkdownLearning`文件夹，此时在文件夹中放入图片。再由小括号中填写文件名就可以在博客中贴图。
还可以使用HTML的`<img>`标签，还有许多例如高度、对齐、宽度标签。具体可见 https://www.w3school.com.cn/tags/tag_img.asp。
下面展示四张图，分别是原始图1、gif图2、网页链接图3、改大小图4。
```
![1png](1.png)
![2gif](2.gif)
![baidu](https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png)
<img src=1.png width="100"/><br/>
```
![1png](1.png)
<div align="center">图1</div>

![2gif](2.gif)
<div align="center">图2</div>

![baidu](https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png)
<div align="center">图3</div>

<img src=1.png width="100"/><br/>
<div align="center">图4</div>

# 7、代码块
````
`单行文字`
```
多行文字1
多行文字2
多行文字3
```
````

`单行文字`
```
多行文字1
多行文字2
多行文字3
```
还可以采用下面的代码块：在连续几行的文本开头加入1个Tab或者4个空格，代码块没有前面的序号。（代码块前需要换行）

    多行文字1
    多行文字2
    多行文字3
也适合做一篇文章的tag。

    `linux` `网络编程` `socket` `epoll`
`linux` `网络编程` `socket` `epoll`

# 8、水平分割线
使用---进行水平分割
水平分割线上方

---
水平分割线下方



# 9、表格
表格 - 和 | 分割行和列 ， : 控制对其方式
```
居左   | 居右 | 居中
:- | -: | :-:
第1行 | 12  | 13  
第2行 | 22  | 23  
第3行 | 32  | 33  
```
居左   | 居右 | 居中
:- | -: | :-:
第1行 | 12  | 13  
第2行 | 22  | 23  
第3行 | 32  | 33  

表格中的样式可以利用html语言进行修改，还需要配合转义字符`\`
如第1部分标题的代码如下

    语法   | 效果 
    :-: | :-: 
    \# 一级标题 | <h1>一级标题</h1>
    \#\# 二级标题 | <h2>二级标题</h2>
    \#\#\# 三级标题 | <h3>三级标题</h3>
    \#\#\#\# 四级标题 | <h4>四级标题</h4>
    正常文字 | 正常文字
    \#\#\#\#\# 五级标题 | <h5>五级标题</h5>
    \#\#\#\#\#\# 六级标题 | <h6>六级标题</h6>

# 10、提示块标签
{% note default %}
default 提示块标签
{% endnote %}

{% note primary no-icon %}  
可使用语法 no-icon去掉小图标
{% endnote %}

{% note success %}
success 提示块标签
{% endnote %}

{% note info %}
info 提示块标签
{% endnote %}

{% note warning %}
warning 提示块标签
{% endnote %}

{% note danger %}
danger 提示块标签
{% endnote %}


# 11、diff语法
版本控制的系统中都少不了diff的功能，即展示一个文件内容的增加与删除。
GFM中可以显示的展示diff效果。使用蓝色表示新增，红色表示删除。
其语法与代码高亮类似，只是在三个反引号后面写diff，
并且其内容中，以 +开头表示新增，-开头表示删除。
````
```diff
+ 鸟宿池边树，僧敲月下门
- 鸟宿池边树，僧推月下门
```
````

```diff
+ 鸟宿池边树，僧敲月下门
- 鸟宿池边树，僧推月下门
```
# 12、锚点
其中，字母要统统小写，空格统统要替换成 '-'

    [回到1、标题](#1、标题)
    [回到2、基本字体样式](#2、基本字体样式)
[回到1、标题](#1、标题)
[回到2、基本字体样式](#2、基本字体样式)

# 13、表情
Github的Markdown语法支持添加emoji表情，输入不同的符号码（两个冒号包围的字符）可以显示出不同的表情。
比如`:blush:`，可以显示:blush:。`:smile:`，可以显示:smile:。`:grinning:`，可以显示:grinning:。`:elephant:`，可以显示:elephant:。`:v:`，可以显示:v:。`:balloon:`，可以显示:balloon:。`:triangular_flag_on_post:`，可以显示:triangular_flag_on_post:。`:fast_forward:`，可以显示:fast_forward:。`:100:`，可以显示:100:。
通过以下代码进行命令行安装配置，还需要配置hexo站点配置文件_config.yml
```
    npm un hexo-renderer-marked --save
    npm i hexo-renderer-markdown-it --save
    npm install markdown-it-emoji --save
```
其他有关表情的符号码和问题可查 https://hasaik.com/posts/9b280ea3.html

