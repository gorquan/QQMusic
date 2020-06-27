#### QQMusic Wine

> 前言：本来我只是打算存档自己打包的软件，看到一年过去有许许多多的star和fork，所以我决定给大家更新一下，让大家能够在Linux用上版权充足的QQ音乐

* 当前版本:17.66

* 更新时间:2020/6/27

* 使用前注意
    1. 请在设置中关闭无版权歌曲有MV资源时自动播放MV

* 存在问题
    1. MV无法播放（之前有个大哥可以播放MV的，提供了解决方案给我，但是他的是wine，不是用deepin-wine，可能会存在一定的不兼容，所以我就没有采用）
    2. 定时播放失效
    3. 设置值选项字体混乱（选项可以正常显示字体的，选择的值乱码而已）
    4. 音效无明显变化？（这个待认证，我听不出有很大的变化）

* 尚未测试
    1. 铃声制作
    2. 音频转码
    3. 传歌到设备

* Fix
    * 2020/6/27
        * 更新到最新版本 17.66
        * 修复乱码问题（有待测试）
        * 在包中添加了simsun.ttc

* ISSUE和PR
    * 如果出现了问题或者有什么好的建议，欢迎提出ISSUE，我会及时进行处理
    * 如果有自己的想法且已经实现了，欢迎提交PR

* 打包方式：详细的打包过程欢迎访问我的[blog](https://blogs.gorquan.cn)进行获取，近段时间我会进行更新

* 依赖：
    * deepin-wine (>= 2.18-12)
    * deepin-wine32 (>= 2.18-12)
    * deepin-wine32-preloader (>= 2.18-12)
    * deepin-wine-helper (>= 1.2deepin8)
    * deepin-wine-uninstaller (>= 0.1deepin2)

* 感谢名单
    * [QQ音乐](https://y.qq.com/)
    * [deepin-wine](https://www.deepin.org)
    * [wszqkzqk](https://github.com/wszqkzqk/deepin-wine-ubuntu)

* 最后
    * 该包不涉及任何反编译行为，希望能让更多Linux用户能够用上QQ音乐客户端，希望官方能够早日研发出Linux平台的QQ音乐
    * 该包仅限于提供给各位学习使用，请勿用于商业行为！
    * 如果引用包时请带上Github仓库链接，请不要直接占用成果，谢谢合作
