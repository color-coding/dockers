# compiling:ibas
ibas应用的编译环境

## 主要内容 | content
* git
* jdk
* maven
* node
* typescript
* tee(dockerfile-tee)
* git-tf(dockerfile-gtf)

## 使用说明 | instruction
* debian
~~~
docker build --force-rm --no-cache -f ./dockerfile -t compiling:ibas ./
docker pull colorcoding/compiling:ibas
docker pull colorcoding/compiling:ibas-tee
docker pull colorcoding/compiling:ibas-gtf
~~~
* alpine
~~~
docker build --force-rm --no-cache -f ./dockerfile-alpine -t compiling:ibas-alpine ./
docker pull colorcoding/compiling:ibas-alpine
docker pull colorcoding/compiling:ibas-tee-alpine
docker pull colorcoding/compiling:ibas-gtf-alpine
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
