# tomcat:ibas
ibas应用的运行环境

## 主要内容 | content
* conf                                tomcat配置
* bin                                 tomcat参数
* ibas/conf                           ibas配置

## 使用说明 | instruction
* tomcat:ibas-alpine
~~~
docker build -f ./dockerfile-alpine -t colorcoding/tomcat:ibas-alpine ./
~~~
* tomcat:ibas-wincore
~~~
docker build -f ./dockerfile-wincore -t colorcoding/tomcat:ibas-wincore ./
~~~
* tomcat:ibas-ubi-minimal
~~~
docker build -f ./dockerfile-ubi-minimal -t colorcoding/tomcat:ibas-ubi-minimal ./
~~~
* tomcat:ibas-alpine-v2
~~~
docker build -f ./dockerfile-alpine -t colorcoding/tomcat:ibas-alpine-v2 --build-arg BTULZ_TRANSFORMS_VERSION="latest-v2" ./
~~~
* tomcat:ibas-ubi-minimal-v2
~~~
docker build -f ./dockerfile-ubi-minimal -t colorcoding/tomcat:ibas-ubi-minimal-v2 --build-arg BTULZ_TRANSFORMS_VERSION="latest-v2" ./
~~~
* tomcat:ibas-wincore-v2
~~~
docker build -f ./dockerfile-wincore -t colorcoding/tomcat:ibas-wincore-v2 --build-arg BTULZ_TRANSFORMS_VERSION="latest-v2" ./
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
