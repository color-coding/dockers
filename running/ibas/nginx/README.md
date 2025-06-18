# nginx:ibas
ibas应用的运行环境

## 主要内容 | content
* deploy_apps.sh                      部署脚本
* NGINX_HOME /usr/share/nginx         环境变量

## 使用说明 | instruction
* nginx:ibas-alpine
~~~
docker build -f ./dockerfile-alpine -t colorcoding/nginx:ibas-alpine ./
~~~
* nginx:ibas-wincore
~~~
docker build -f ./dockerfile-wincore -t colorcoding/nginx:ibas-wincore ./
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
