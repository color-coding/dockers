# compiling:ibas
ibas应用的编译环境

## 编译环境 | content
* git
* jdk
* maven
* node
* typescript
* tee(dockerfile-tee)
* git-tf(dockerfile-gtf)

## 使用说明 | instruction
* compiling:ibas debian
~~~
docker build --force-rm -f ./dockerfile -t colorcoding/compiling:ibas ./
~~~
* compiling:ibas-alpine
~~~
docker build --force-rm -f ./dockerfile-alpine -t colorcoding/compiling:ibas-alpine ./
~~~
* compiling:ibas-gtf-alpine （git tf）
~~~
docker build --force-rm -f ./dockerfile-gtf-alpine -t colorcoding/compiling:ibas-gtf-alpine ./
~~~
* compiling:ibas-tee-alpine （team-explorer-everywhere）
~~~
docker build --force-rm -f ./dockerfile-tee-alpine -t colorcoding/compiling:ibas-tee-alpine ./
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
