# compiling or developing
ibas应用的编译环境或开发环境

## 编译容器 | building
可使用脚本构建并发布全部镜像，或通过目标参数选择镜像：
~~~
cd ./compiling
./builds.sh
./builds.sh --only ibas-alpine,ibas-ubi-minimal-v2
./builds.sh webtop-ibas-ubuntu
~~~

* compiling:ibas-alpine
~~~
docker build -f ./dockerfile-alpine -t colorcoding/compiling:ibas-alpine ./
~~~
* compiling:ibas-ubi-minimal-v2
~~~
docker build -f ./dockerfile-21-ubi-minimal -t colorcoding/compiling:ibas-ubi-minimal-v2 ./
~~~
* webtop:ibas-ubuntu
~~~
docker build -f ./dockerfile-vscode-eclipse -t colorcoding/webtop:ibas-ubuntu ./
~~~

## 使用说明 | using
* compiling:ibas-alpine
~~~
docker run -it --rm \
  -v ~/.m2:/home/coder/.m2 \
  -v ~/codes:/home/coder/codes \
  colorcoding/compiling:ibas-alpine bash
~~~
* compiling:ibas-ubi-minimal-v2
~~~
docker run -it --rm \
  -v ~/.m2:/home/coder/.m2 \
  -v ~/codes:/home/coder/codes \
  colorcoding/compiling:ibas-ubi-minimal-v2 bash
~~~
* webtop:ibas-ubuntu
~~~
docker run -d -p 80:80 colorcoding/webtop:ibas-ubuntu
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
