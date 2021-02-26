---
title: 【第6篇博客】写博客的git概念和指令学习记录
date: 2021-01-09 10:55:12
updated: 2021-01-26 10:31:23
cover: 0.gif
tags:
  - hexo
  - github
categories: 
  - 博客搭建记录
---

在写完博客之后，一般都是通过`git add .`、`git commit -m "message"`、`git push`进行提交，至于这些代码的含义及相关概念是什么？本文就带着这些问题进行学习并记录。

## 四个工作区域

git本地有四个工作区域，文件在这四个区域之间的转换关系如下：
![1png](1.jpg)

- `workspace`：工作区，就是你平时存放项目代码的地方。
- `staging area`：又叫`Index / Stage`，暂存区/缓冲区，用于临时存放你的改动，事实上它只是一个文件，保存即将提交到文件列表信息。
- `local repository`：本地仓库区（或版本库），就是安全存放数据的位置，这里面有你提交到所有版本的数据。其中HEAD指向最新放入仓库的版本。
- `remote repository`：远程仓库，托管代码的服务器，可以简单的认为是你项目组中的一台电脑用于远程数据交换。

因此，git的工作流程一般是这样的：通过`git add .`将在工作区中修改、添加后的文件从工作区移至暂存区；再通过`git commit `移至本地仓库；最后通过`git push`推到远程仓库中。

因此，git管理的文件有三种状态：已修改（modified），已暂存（staged），已提交(committed)。

## 文件的版本控制
版本控制就是对文件的版本控制，要对文件进行修改、提交等操作，首先要知道文件当前在什么状态，不然可能会提交了现在还不想提交的文件，或者要提交的文件没提交上。

git不关心文件两个版本之间的具体差别，而是关心文件的整体是否有改变，若文件被改变，在添加提交时就生成文件新版本的快照，而判断文件整体是否改变的方法就是用SHA-1算法计算文件的校验和。

版本控制的文件状态有四种，如下图所示。

![2png](2.png)


`Untracked`： 未跟踪，此文件在文件夹中，但并没有加入到git库，不参与版本控制。 通过git add可将状态变为Staged。

`Unmodify`： 文件已经入库，但未修改，即版本库中的文件快照内容与文件夹中完全一致。 这种类型的文件有两种去处，如果它被修改，而变为Modified。如果使用git rm移出版本库，则成为Untracked文件。

`Modified`： 文件已修改，仅仅是修改，并没有进行其他的操作。 这个文件也有两个去处，通过git add可进入暂存staged状态，使用git checkout 则丢弃修改过，返回到unmodify状态，这个git checkout即从库中取出文件，覆盖当前修改。

`Staged`： 暂存状态。 执行git commit则将修改同步到库中，这时库中的文件和本地文件又变为一致，文件为Unmodify状态。 执行git reset HEAD filename取消暂存，文件状态为Modified。


## git status命令
在命令行中输入git status命令可以得到文件在工作区、暂存区的状态，下面展示这不同的三种状态：

    PS C：\Users\tsui\blog> git status
    On branch myblog
    Your branch is up to date with 'origin/myblog'.

    Changes to be committed：
    (use "git restore --staged <file>..." to unstage)
            modified：   source/_posts/blog3_DnsBlogGithubIo.md
            modified：   source/_posts/blog6_hexo_commands.md
            modified：   source/_posts/blog7-MarkdownLearning.md
            new file：   source/_posts/blog8-BaseGit.md
            new file：   source/_posts/blog8-BaseGit/0.gif

    Changes not staged for commit：
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
            modified：   source/_posts/blog8-BaseGit.md

    Untracked files：
    (use "git add <file>..." to include in what will be committed)
            source/_posts/te.md

1. `Changes to be committed`：表示已经从工作区add到暂存区的file（文件或文件夹），可以通过 `git restore --staged filename` 命令将该file从暂存区移出，只有工作区有该文件，该文件就为Untracked files。通过 `git commit -m [message]`将暂存区内容添加到本地仓库中，此时我的vscode左侧工具栏源代码管理被挂起的文件，即一个小数字，将会消失。而在vscode底部状态栏的源代码管理处上拉数加一。
2. `Changes not staged for commit`：表示文件还在工作区修改，没有add到暂存区。可以通过 `git add file` 命令将变更文件添加到暂存区，如此便可取消Changes not staged for commit状态。还可以通过 `git restore  file` 的命令取消在file在工作区的变更，那么暂存区的file内容还是以前的，也取消Changes not staged for commi的状态。
3. `Untracked files：`表示只在工作区有的file（文件或文件夹），也就是在暂时区没有该file。

## git commit
git 每次提交代码，都要写 Commit message (提交说明)，应该清晰明了，说明本次提交的目的。git commit 命令将暂存区内容添加到本地仓库中。

    git commit -m [message]
[message] 可以是一些备注信息。

还可以提交暂存区的指定文件到仓库区：

    git commit [file1] [file2] ... -m [message]

目前, 社区有多种 Commit message 的写法规范, 例如[Angular规范](https://www.jianshu.com/p/1b56cd033eea)。规范主要针对的问题如下：
1. 版本回退时无法快速定位到指定版本
2. 无法知道项目中封版操作是哪一个commit
3. 无法清晰的知道每次提交的记录

### commit提交规范
每次提交，Commit message 都包括三个部分：Header，Body 和 Footer。
其中，Header 是必需的，Body 和 Footer 可以省略。

### Commit message 的作用
格式化的Commit message，有几个好处
1. 提供更多的历史信息，方便快速浏览
2. 可以过滤某些commit（比如文档改动）, 便于快速查找信息
3. 可以直接从commit生成Change log

### Commit message 的格式
每次提交，Commit message 都包括三个部分：`Header`，`Body` 和`Footer`

```
    <type>(<scope>): <subject>
    // 空一行
    <body>
    // 空一行
    <footer>
```

其中, Header 是必需的, Body 和 Footer 可以省略不管是哪一个部分, 任何一行都不得超过72个字符（或100个字符）, 这是为了避免自动换行影响美观。

**一、Header**
Header部分只有一行，包括三个字段：type（必需）、scope（可选）和subject（必需）。
1. type
type用于说明 commit 的类别，只允许使用下面7个标识。其中，如果type为feat和fix，则该 commit 将肯定出现在 Change log 之中. 其他情况（docs、chore、style、refactor、test）由你决定，要不要放入 Change log，建议是不要。

    - feat：新功能（feature）
    - fix：修补bug
    - docs：文档（documentation）
    - style： 格式（不影响代码运行的变动）
    - refactor：重构（即不是新增功能，也不是修改bug的代码变动）
    - test：增加测试
    - chore：构建过程或辅助工具的变动

2. scope
scope用于说明commit 影响的范围，比如数据层、控制层、视图层等等，视项目不同而不同。

3. subject
subject 是 commit 目的的简短描述，不超过50个字符以动词开头，使用第一人称现在时，比如change , 而不是 changed 或 changes 第一个字母小写, 结尾不加句号（.）

**二、Body**
Body 部分是对本次 commit 的详细描述, 可以分成多行。下面是一个范例：

    More detailed explanatory text, if necessary. Wrap it to about 72 characters or so. Further paragraphs come after blank lines.- Bullet points are okay, too- Use a hanging indent
有两个注意点:
1. 使用第一人称现在时, 比如使用change, 而不是changed或changes
2. 应该说明代码变动的动机. 以及与以前行为的对比

**三、Footer**
Footer 部分只用于两种情况。
1. 不兼容变动
如果当前代码与上一个版本不兼容，则 Footer 部分以BREAKING CHANGE
开头，后面是对变动的描述、以及变动理由和迁移方法。
    
        BREAKING CHANGE: isolate scope bindings definition has changed. To migrate the code follow the example below: Before: scope: { myAttr: 'attribute', } After: scope: { myAttr: '@', } The removed inject wasn't generaly useful for directives so there should be no code using it.
2. 关闭Issure
如果当前 commit 针对某个issue, 那么可以在 Footer 部分关闭这个 issue。

        Closes #234
---

## 其他的一些git指令

### git add
`git add` 命令可将该文件添加到暂存区。
添加一个或多个文件到暂存区：

    git add [file1] [file2] ...
添加指定目录到暂存区，包括子目录：

    git add [dir]
添加当前目录下的所有文件到暂存区：

    git add .

### git clone
`git clone` 拷贝一个 git 仓库到本地，让自己能够查看该项目，或者进行修改。
拷贝项目命令格式如下：

    git clone [url]
[url] 是你要拷贝的项目。
默认情况下，git 会按照你提供的 URL 所指向的项目的名称创建你的本地项目目录。 通常就是该 URL 最后一个 / 之后的项目名称。如果你想要一个不一样的名字，你可以在该命令后加上你想要的名称。

### git push
`git push` 用于从将本地的分支版本上传到远程并合并。
命令格式如下：

    git push <远程主机名> <本地分支名>：<远程分支名>
如果本地分支名与远程分支名相同，则可以省略冒号和远程分支名
`git push origin master`将本地的 master 分支推送到 origin 主机的 master 分支。

### git pull
`git pull` 命令用于从远程获取代码并合并本地的版本。

    git pull <远程主机名> <远程分支名>：<本地分支名>

更新操作：

    git pull
    git pull origin
将远程主机 origin 的 master 分支拉取过来，与本地的 brantest 分支合并。

    git pull origin master：brantest
如果远程分支是与当前分支合并，则冒号后面的部分可以省略。

    git pull origin master
上面命令表示，取回 origin/master 分支，再与本地的 brantest 分支合并。


参考：
https://www.cnblogs.com/qdhxhz/p/9757390.html
https://www.jianshu.com/p/1b56cd033eea
