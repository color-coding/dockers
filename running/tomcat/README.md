# tomcat
自建tomcat镜像

## 主要内容 | content
### tomcat 8.5
* tomcat:8.5-alpine
~~~
docker build -f ./dockerfile-8.5-alpine -t colorcoding/tomcat:8.5-alpine ./
~~~
* tomcat:8.5-wincore
~~~
# certs目录为证书，脚本会自动注册
docker build -f ./dockerfile-8.5-wincore -t colorcoding/tomcat:8.5-wincore ./
~~~
### tomcat 9.0
* tomcat:9.0-alpine
~~~
docker build -f ./dockerfile-9.0-alpine -t colorcoding/tomcat:9.0-alpine ./
~~~
* tomcat:9.0-wincore
~~~
# certs目录为证书，脚本会自动注册
docker build -f ./dockerfile-9.0-wincore -t colorcoding/tomcat:9.0-wincore ./
~~~
* tomcat:9.0-ubi-minimal
~~~
docker build -f ./dockerfile-9.0-ubi-minimal -t colorcoding/tomcat:9.0-ubi-minimal ./
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
