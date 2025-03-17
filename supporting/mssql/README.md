# SQL Server 2022
SQL Server 2022 Developer Edition for Windows Containers

## 编译容器 | building
* mssql-server:2022
~~~
# 需要先下载安装包，详见dockerfile
docker build --rm --force-rm -f ./dockerfile -t colorcoding/mssql-server:2022 ./
~~~

## 使用说明 | using
* mssql-server:2022
~~~
docker run -d \
    -p 1433:1433 \
    -e sa_password=<YOUR SA PASSWORD> \
    -e ACCEPT_EULA=Y \
    colorcoding/mssql-server:2022
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
