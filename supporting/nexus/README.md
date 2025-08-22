# Nexus OSS
maven、docker等仓库管理器

## 编译容器 | building
* nexus:latest
~~~
docker build -f ./dockerfile-ibm-semeru -t colorcoding/nexus:latest ./
~~~

## 使用说明 | using
* nexus:latest
~~~
chown -R 200 $PWD/nexus-data
docker run -d \
    --name nexus-cc-maven \
    -m 2g \
    -v $PWD/nexus-data:/nexus-data \
    colorcoding/nexus:latest
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
