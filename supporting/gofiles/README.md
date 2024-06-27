# gofiles
文件服务镜像

## 编译容器 | building
* gofiles
~~~
docker build --force-rm -f ./dockerfile --build-arg TARGETOS=linux --build-arg TARGETARCH=amd64 -t colorcoding/gofiles ./
~~~
~~~
# 多平台编译
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -f ./dockerfile -t colorcoding/gofiles --push ./
~~~

## 使用说明 | using
* gofiles
~~~
docker run --name gofiles -d -p 80:80 -v $PWD/gofiles:/home/files colorcoding/gofiles
~~~

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
