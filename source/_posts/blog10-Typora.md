---
title: 【第10篇博客】博客操作优化1——使用Typora编写markdown博客
tags:
  - Typora
  - markdown
  - 博客优化
categories:
  - 博客搭建记录
date: 2021-03-06 12:06:31
updated: 2021-03-06 12:06:31
description: 本文将介绍使用Typora来写markdown语言，方便图片粘贴，以及自己的优化博客操作中的Typora偏好设置。
cover: "https://gitee.com/tsuiwade/images/raw/master/20210310123446.png"
---



## 一个markdown文本编辑器

「它的**功能之强大、设计之冷静、体验之美妙、理念之先进**，我认为值得所有笔记应用厂商学习。」

![beta](https://gitee.com/tsuiwade/images/raw/master/beta.gif)

[Typora](https://www.typora.io/) 是一款**支持实时预览的 Markdown 文本编辑器**。它有 OS X、Windows、Linux 三个平台的版本，并且由于仍在测试中，是**完全免费**的。

由于目前还没有一个权威机构对 Markdown 的语法进行规范，各应用厂商制作时遵循的 Markdown 语法也是不尽相同的。其中比较受到认可的是 [GFM 标准](https://github.github.com/gfm/)，它是由著名代码托管网站 [GitHub](https://github.com/) 所制定的。Typora 主要使用的也是 GFM 标准。同时，你还可以在 `文件 - 偏好设置 - Markdown 语法偏好 - 严格模式` 中将标准设置为「更严格地遵循 GFM 标准」。具体内容你可以在官方的 [这篇文档](http://support.typora.io/Strict-Mode/) 中查看。



## 适用于自己的Typora配置

1. **快捷键**

   打开自己电脑根目录下的`C:\Users\tsui\AppData\Roaming\Typora\conf`文件夹（读者自行修改该目录），如下图所示：

   ![image-20210306195316546](https://gitee.com/tsuiwade/images/raw/master/image-20210306195316546.png)

   打开`conf.user.json`文件，主要修改画框处的代码即可，如下图所示：

   ![image-20210306195441753](https://gitee.com/tsuiwade/images/raw/master/image-20210306195441753.png)

   至于代码中的`Always on Top`和我代码中的`Delete Line/Sentence`这些参数，该如何找呢？打开偏好设置，语言设置为英文，再从工具栏中找到对应的操作，例如我要设置删除改行（vscode中的Ctrl+D，很是方便），如下图所示：

   ![img](https://gitee.com/tsuiwade/images/raw/master/8EFBAA12EABA3092AE1EB1CE061298DD.png)

   找到对应的参数名`Delete Line/Sentence`，然后再设置具体的快捷键即可。

   还可以参考官网的快捷键帮助https://support.typora.io/Shortcut-Keys/ 。

2. **侧边栏**

   `侧边栏`保持显示侧边栏，主要显示文件数和大纲，可以帮助开发。快捷键为Ctrl+Shift+L。

   ![](https://gitee.com/tsuiwade/images/raw/master/image-20210306194555367.png)

3. **启动选项**

   `启动选项`选择重新打开选择重新打开上次使用的文件和目录，这样直接打开Typora软件即可找到上次编写的位置，同vscode一样，无需一步步打开文件，很是方便。

   在偏好设置里设置：

   ![image-20210306194138225](https://gitee.com/tsuiwade/images/raw/master/image-20210306194138225.png)

   


## 图片插入

Typora 的图片插入功能是广受好评的。要知道，Markdown 原生不太注重图片插入的功能，但你可以在 Typora 中：

- 直接使用 `右键 - 复制 Ctrl + V` 将网络图片、剪贴板图片复制到文档中
- 拖动本地图片到文档中

Typora 会自动帮你插入符合 Markdown 语法的图片语句，并给它加上标题。如：

`![](https://gitee.com/tsuiwade/images/raw/master/20210310123322.png)`

现在已经支持粘贴图片自动上传至图床了，使用PicGo，具体参见我的另一篇博客。

## 打字机模式和专注模式

**「打字机模式」**使得你所编辑的那一行永远处于屏幕正中。

**「专注模式」**使你正在编辑的那一行保留颜色，而其他行的字体呈灰色。

你可以在 `视图 - 专注模式 / 打字机模式` 中勾选使用这两个模式。

## 实时预览

我想很果断地下这个结论：到现在还不支持编辑界面实时预览的 Markdown 编辑器基本可以退出市场了。Typora 在这一方面显然已经领先了一大步——他们连 Markdown 语法的标记都在实时预览中消去了。当你离开正在编辑的有格式的文本段后，Typora 会自动隐藏 Markdown 标记，只留下**「所见即所得」**的美妙。他们把这称为 *Hybrid View。*

为了防止一些程序 bug 的发生（虽然在我使用下来感到是很少的）导致格式问题无法修改，Typora 保留了一个**「源代码模式」**。你可以通过 `视图 - 源代码模式` 或左下角的 `</>` 按钮进入。

## 大纲 / 文件侧边栏配置

Typora 会根据你 Markdown 标记的 H1、H2、H3…… 各级标题为你呈现一个大纲。

你也可以选择查看文件夹中的文件，但由于目前 Typora 只支持查看 md 文件。     

## 空格与换行

Typora 在空格与换行部分主要是使用 [CommonMark](http://www.commonmark.cn/w/) 作为标注规范。与前文提到的 GFM 一样，CommonMark 也是比较流行的 Markdown 语言规范（解析器）之一。 

- **空格：**在输入连续的空格后，Typora 会在编辑器视图里为你保留这些空格，但当你打印或导出时，这些空格会被省略成一个。 
  你可以在源代码模式下，为每个空格前加一个 `\` 转义符，或者直接使用 HTML 风格的 `&nbps;` 来保持连续的空格。
- **软换行：**需要说明的是，在 Markdown 语法中，换行（line break）与换段是不同的。且换行分为软换行和硬换行。在 Typora 中，你可以通过 `Shift + Enter` 完成一次软换行。软换行只在编辑界面可见，当文档被导出时换行会被省略。
- **硬换行：**你可以通过 `空格 + 空格 + Shift + Enter` 完成一次硬换行，而这也是许多 Markdown 编辑器所原生支持的。硬换行在文档被导出时将被保留，且没有换段的段后距。
- **换段：**你可以通过 `Enter` 完成一次换段。Typora 会自动帮你完成两次 `Shift + Enter` 的软换行，从而完成一次换段。这也意味着在 Markdown 语法下，换段是通过在段与段之间加入空行来实现的。 

## emoji表情

在 Typora 中，你可以用 `:emoji:` 的形式来打出 emoji，软件会自动给出图形的提示，还是比较好用的。:sunny:、:cow:、:grey_question:。

emoji编码合集可参考https://blog.csdn.net/weixin_42395140/article/details/111642339 。

## 其他功能

Typora还提供了如同**word**快捷键的操作包括加粗、斜体等。

在vscode中写markdown的表格一直是一件比较头疼的事情。好在 Typora 为我们提供了图形界面的插入表格的功能，你只需要在行内 `鼠标右键 - 插入 - 表格` ，并输入行数和列数，Typora 就会自动生成一张样式不错的空表格。

![image-20210306211350709](https://gitee.com/tsuiwade/images/raw/master/image-20210306211350709.png)

## hexo new post 更换模板

除了上述介绍来的Typora使用之外，本文还将介绍如何优化 每次新建博客之后填写博客文章摘要信息的操作。

每当我们hexo n blog的时候，在未设置模板的情况下，如何才能出现以下完整的信息呢？

```md
title: 【第10篇博客】博客操作优化1——使用Typora编写markdown博客
tags:
  - Typora
  - markdown
  - 博客优化
categories:
  - 博客搭建记录
date: 2021-03-06 12:06:31
updated: 2021-03-06 12:06:31
description: 时至今日，可以优化一下博客的操作，本文将介绍使用Typora来写markdown语言，最为方便的在于图片的粘贴。以及自己的优化操作中的Typora偏好设置。
cover: "https://gitee.com/tsuiwade/images/raw/master/20210310123446.png"
```

通过查看文档，找到模板文件的路径：

![image-20210306214807156](https://gitee.com/tsuiwade/images/raw/master/image-20210306214807156.png)

打开post填写以下信息，保存即可。

```md
title: {{ title }}
date: {{ date }}
updated: {{ date }}
description:  
cover: 
tags: 
  - 
categories: 
  - 
```

将来hexo n blog的时候，将会自动存在这些基础信息。

---

本文参考：https://sspai.com/post/54912