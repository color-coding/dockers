# Web Desktop
基于ubuntu的浏览器桌面环境

## 编译容器 | building
* webtop:ubuntu
~~~
docker build --rm --force-rm -f ./dockerfile-ubuntu -t colorcoding/webtop:ubuntu ./
~~~
* webtop:ubuntu-kasm
~~~
docker build --rm --force-rm -f ./dockerfile-ubuntu-kasm -t colorcoding/webtop:ubuntu-kasm ./
~~~

## 使用说明 | using
* webtop:ubuntu
~~~
docker run --rm -d -p 80:80 colorcoding/webtop:ubuntu
~~~
* webtop:ubuntu-kasm
~~~
docker run --rm -d -p 80:80 colorcoding/webtop:ubuntu-kasm
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
