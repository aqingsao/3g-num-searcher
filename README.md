3g-num-searcher
==========

中国联通3G号码搜索神器

## 简介
中国联通提供过了自己的[3G号码搜索页面](http://num.10010.com/NumApp/chseNumList/init)，但是有以下缺点：

* 搜索时只能搜索以****结尾的号码，而无法查找****在中间的号码
* 过滤时只能提供2-4位号码进行过滤
* 不能过滤不想要的数字，如4

鉴于此，用Ruby写了这个小脚本，可以快速查找心仪的号码。

备注：已经过滤了所有靓号，即需要预付费的号码；

## 用法
确保电脑上安装了Ruby，目前我使用的Ruby版本为1.9.3
查看是否安装： ruby -v

下载本代码后，切换到代码所在当前目录：

ruby search.rb ****    // 把****替换为你喜欢的号码，任意多位  
ruby search.rb **** -e // 查看结果时过滤包含4的号码

