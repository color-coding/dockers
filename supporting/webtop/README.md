# Web Desktop
基于Linux的浏览器桌面环境

## 编译容器 | building
* webtop:ubuntu
~~~
docker build --rm -f ./dockerfile-ubuntu -t colorcoding/webtop:ubuntu ./
~~~
* webtop:alpine
~~~
docker build --rm -f ./dockerfile-alpine -t colorcoding/webtop:alpine ./
~~~

## 使用说明 | using
* webtop:ubuntu
~~~
docker run --rm -d -p 80:80 colorcoding/webtop:ubuntu
~~~
* webtop:alpine
~~~
docker run --rm -d -p 80:80 colorcoding/webtop:alpine
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
