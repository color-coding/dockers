# supporting
支持环境镜像

## 主要内容 | content
* 创建maven仓库（nexus oss）
~~~
chown -R 200 $PWD/nexus-data
docker run -d \
    --name nexus-cc-maven \
    -m 2g \
    -v $PWD/nexus-data:/nexus-data \
    sonatype/nexus3
~~~


### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
