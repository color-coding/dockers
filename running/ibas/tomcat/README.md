# tomcat:ibas
ibas应用的运行环境

## 主要内容 | content
* conf                                tomcat配置
* ibas/conf                           ibas配置

## 使用说明 | instruction
* debian
~~~
docker build --force-rm --no-cache -f ./dockerfile -t tomcat:ibas ./
docker pull colorcoding/tomcat:ibas
~~~
* alpine
~~~
docker build --force-rm --no-cache -f ./dockerfile-alpine -t tomcat:ibas-alpine ./
docker pull colorcoding/tomcat:ibas-alpine
~~~
* windows server core
~~~
docker build --force-rm --no-cache -f ./dockerfile-wincore -t tomcat:ibas-wincore ./
docker pull colorcoding/tomcat:ibas-wincore
~~~
* windows nano server
~~~
docker build --force-rm --no-cache -f ./dockerfile-winnano -t tomcat:ibas-winnano ./
docker pull colorcoding/tomcat:ibas-winnano
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
