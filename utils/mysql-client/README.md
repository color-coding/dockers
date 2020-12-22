# mysql-client
支持环境镜像

## 主要内容 | content
* MySql脚本执行
~~~
docker run \
    -it \
    -v <folder to sql>:/sqls \
    --link <mysql server container name>:mysql \
    colorcoding/mysql-client
~~~


### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
