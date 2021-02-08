---
title: 【第8篇博客】git的commit提交博客规范学习记录
date: 2021-02-07 09:51:27
cover: 0.gif
tags:
---

git status命令表示：文件，文件夹在工作区，暂存区的状态，下图就是文件，文件夹三种状态：

>
    PS C:\Users\tsui\blog> git status
    On branch myblog
    Your branch is up to date with 'origin/myblog'.

    Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
            modified:   source/_posts/blog3_DnsBlogGithubIo.md
            modified:   source/_posts/blog6_hexo_commands.md
            modified:   source/_posts/blog7-MarkdownLearning.md
            new file:   source/_posts/blog8-BaseGit.md
            new file:   source/_posts/blog8-BaseGit/0.gif

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
            modified:   source/_posts/blog8-BaseGit.md

1. `Changes to be committed`:表示已经从工作区add到暂存区的file（文件或文件夹），可以通过 git restore --staged filename 命令将该file从暂存区移出，只有工作区有该文件，该文件就为Untracked files。
2. `Changes not staged for commit`:表示工作区，暂时区都存在的file（文件或文件夹），在工作区进行修改或删除，但是没有add到暂存区，可以通过 git add file 命令将变更（修改，删除）的file add到暂存区，此时该file没有Changes not staged for commit状态，也就是Changes not staged for commit将没有改file的记录了。可以通过 git restore  file 的命令取消在file在工作区的变更，那么暂存区的file内容还是以前的，并且file在Changes not staged for commi状态下没有记录。
3. `Untracked files:`表示只在工作区有的file（文件或文件夹），也就是在暂时区没有该file。

---

首先展示git push之后，未做任何修改时的git status状态，不出现任何一种状态。

    PS C:\Users\tsui\blog> git status
    On branch myblog
    Your branch is up to date with 'origin/myblog'.

---
当新建一篇博客hexo n "test"和

当修改博客内容时，出现以下状态。

    PS C:\Users\tsui\blog> git status
    On branch myblog
    Your branch is up to date with 'origin/myblog'.

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
            modified:   source/_posts/blog8-BaseGit.md

    no changes added to commit (use "git add" and/or "git commit -a")
`Changes not staged for commit`:表示文件还在工作区修改，没有add到暂存区。可以通过 `git add file` 命令将变更文件添加到暂存区，如此便可取消Changes not staged for commit状态。还可以通过 `git restore  file` 的命令取消在file在工作区的变更，那么暂存区的file内容还是以前的，也取消Changes not staged for commi的状态。

---
git add . 

    PS C:\Users\tsui\blog> git status
    On branch myblog
    Your branch is up to date with 'origin/myblog'.

    Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
            modified:   source/_posts/blog8-BaseGit.md

表示已经从工作区add到暂存区的file（文件或文件夹），可以通过 git restore --staged filename 命令将该file从暂存区移出，只有工作区有该文件，该文件就为Untracked files。

---


## 1、四个工作区域
Git本地有四个工作区域：工作目录（Working Directory）、暂存区(Stage/Index)、资源库(Repository或Git Directory)、git仓库(Remote Directory)。文件在这四个区域之间的转换关系如下：
![1png](1.png)
`Workspace`：工作区，就是你平时存放项目代码的地方。
`Index / Stage`：暂存区，用于临时存放你的改动，事实上它只是一个文件，保存即将提交到文件列表信息
`Repository`：仓库区（或版本库），就是安全存放数据的位置，这里面有你提交到所有版本的数据。其中HEAD指向最新放入仓库的版本。
`Remote`：远程仓库，托管代码的服务器，可以简单的认为是你项目组中的一台电脑用于远程数据交换。

Git 每次提交代码, 都要写 Commit message (提交说明), 应该清晰明了, 说明本次提交的目的。

    git commit -m "hello world"

上面的命令的-m参数，就是用来指定 commit mesage 的, 如果一行不够, 可以只执行git commit, 就会跳出文本编译器, 让你写多行

    git commit





## 遇到一些问题
1. 版本回退时无法快速定位到指定版本
2. 无法知道项目中封版操作是哪一个commit
3. 无法清晰的知道每次提交的记录

## commit提交规范
每次提交，Commit message 都包括三个部分：Header，Body 和 Footer。
其中，Header 是必需的，Body 和 Footer 可以省略。

## Commit message 的作用
格式化的Commit message，有几个好处
（1）提供更多的历史信息，方便快速浏览
比如, 下面的命令显示上次发布后的变动, 每个commit占据一行. 你只看行首, 就知道某次 commit 的目的