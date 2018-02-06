# nginx:ibas
ibas应用的运行环境

## 主要内容 | content
* deploy_apps.sh                      部署脚本
* NGINX_HOME /usr/share/nginx         环境变量

## 使用说明 | instruction
* debian
~~~
docker build --force-rm --no-cache -f ./dockerfile -t nginx:ibas ./
docker pull colorcoding/nginx:ibas
~~~
* alpine
~~~
docker build --force-rm --no-cache -f ./dockerfile-alpine -t nginx:ibas-alpine ./
docker pull colorcoding/nginx:ibas-alpine
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
