# tomcat
自建tomcat镜像

## 主要内容 | content
* tomcat:8.5-alpine
~~~
docker build --force-rm -f ./dockerfile-8.5-alpine -t colorcoding/tomcat:8.5-alpine ./
~~~
* tomcat:8.5-wincore
~~~
# certs目录为证书，脚本会自动注册
docker build --force-rm -f ./dockerfile-8.5-wincore -t colorcoding/tomcat:8.5-wincore ./
~~~
* tomcat:8.5-winnano
~~~
docker build --force-rm -f ./dockerfile-8.5-winnano -t colorcoding/tomcat:8.5-winnano ./
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
