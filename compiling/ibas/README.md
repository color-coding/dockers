# compiling or developing
ibas应用的编译环境或开发环境

## 编译容器 | building
* compiling:ibas-alpine
~~~
docker build --force-rm -f ./dockerfile-alpine -t colorcoding/compiling:ibas-alpine ./
~~~
* developing:ibas-ubuntu
~~~
docker build --force-rm -f ./dockerfile-vscode-eclipse -t colorcoding/developing:ibas-ubuntu ./
~~~
* developing:ibas-ubuntu-kasm
~~~
docker build --force-rm -f ./dockerfile-vscode-eclipse-kasm -t colorcoding/developing:ibas-ubuntu-kasm ./
~~~

## 使用说明 | using
* compiling:ibas-alpine
~~~
docker run -it --rm colorcoding/compiling:ibas-alpine ash
~~~
* developing:ibas-ubuntu
~~~
docker run -d -p 80:80 colorcoding/developing:ibas-ubuntu
~~~
* developing:ibas-ubuntu-kasm
~~~
docker run --privileged=true -d -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock colorcoding/developing:ibas-ubuntu-kasm
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
