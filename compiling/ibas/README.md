# compiling or developing
ibas应用的编译环境或开发环境

## 编译容器 | building
* compiling:ibas-alpine
~~~
docker build -f ./dockerfile-alpine -t colorcoding/compiling:ibas-alpine ./
~~~
* webtop:ibas-ubuntu
~~~
docker build -f ./dockerfile-vscode-eclipse -t colorcoding/webtop:ibas-ubuntu ./
~~~

## 使用说明 | using
* compiling:ibas-alpine
~~~
docker run -it --rm colorcoding/compiling:ibas-alpine ash
~~~
* webtop:ibas-ubuntu
~~~
docker run -d -p 80:80 colorcoding/webtop:ibas-ubuntu
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
