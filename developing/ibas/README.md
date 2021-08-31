# developing:ibas
ibas应用的开发环境，带桌面

## 主要内容 | content
* git
* jdk
* maven
* node
* typescript
* vscode, eclipse (dockerfile-vscode-eclipse)

## 使用说明 | instruction
* colorcoding/developing:ibas
~~~
docker build --force-rm -f ./dockerfile -t colorcoding/developing:ibas ./
~~~
* developing:ibas-vscode-eclipse （vscode, eclipse）
~~~
docker build --force-rm -f ./dockerfile-vscode-eclipse -t colorcoding/developing:ibas-vscode-eclipse ./
docker run -p 80:80 -e HTTP_PASSWORD=1q2w3e colorcoding/developing:ibas-vscode-eclipse
~~~

### 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
