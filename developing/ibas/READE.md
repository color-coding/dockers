# developing:ibas
ibas应用的开发环境

## 主要内容 | content
* git
* jdk
* maven
* node
* typescript
* vscode, eclipse (dockerfile-vscode-eclipse)

## 使用说明 | instruction
* environment
~~~
docker build --force-rm --no-cache -f ./dockerfile -t developing:ibas ./
docker pull colorcoding/developing:ibas
~~~
* vscode, eclipse
~~~
docker build --force-rm --no-cache -f ./dockerfile-vscode-eclipse -t developing:ibas-vscode-eclipse ./
docker pull colorcoding/developing:ibas-vscode-eclipse
docker run -p 80:80 -e HTTP_PASSWORD=1q2w3e colorcoding/developing:ibas-vscode-eclipse
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
