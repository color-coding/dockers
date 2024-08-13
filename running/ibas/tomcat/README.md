# tomcat:ibas
ibas应用的运行环境

## 主要内容 | content
* conf                                tomcat配置
* ibas/conf                           ibas配置

## 使用说明 | instruction
* tomcat:ibas-alpine
~~~
docker build --force-rm --no-cache -f ./dockerfile-alpine -t colorcoding/tomcat:ibas-alpine ./
~~~
* tomcat:ibas-wincore
~~~
docker build --force-rm --no-cache -f ./dockerfile-wincore -t colorcoding/tomcat:ibas-wincore ./
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
