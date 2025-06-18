# SQL Server
SQL Server Developer Edition for Windows Containers

## 编译容器 | building
* mssql-server:2017
~~~
# 需要先下载安装包，详见dockerfile
docker build --rm -f ./dockerfile-2017 -t colorcoding/mssql-server:2017 ./
~~~
* mssql-server:2022
~~~
# 需要先下载安装包，详见dockerfile
docker build --rm -f ./dockerfile-2022 -t colorcoding/mssql-server:2022 ./
~~~

## 使用说明 | using
* mssql-server:2017
~~~
docker run -it \
    --isolation=hyperv \
    -p 1433:1433 \
    -e SA_PASSWORD=<YOUR SA PASSWORD> \
    -e ACCEPT_EULA=Y \
    colorcoding/mssql-server:2017
~~~
* mssql-server:2022
~~~
docker run -it \
    --isolation=hyperv \
    -p 1433:1433 \
    -e SA_PASSWORD=<YOUR SA PASSWORD> \
    -e ACCEPT_EULA=Y \
    colorcoding/mssql-server:2022
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
