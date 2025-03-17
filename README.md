# dockers
相关docker镜像

## 安装 | install
* windows
~~~
# powershell
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1" -o install-docker-ce.ps1;
.\install-docker-ce.ps1;
~~~

## 编译 | compiling
* [详细说明](./compiling/ibas/README.md)

## 运行 | running
* [详细说明：OpenJDK](./running/openjdk/README.md)
* [详细说明：Tomcat](./running/tomcat/README.md)
* [详细说明：Nginx](./running/nginx/README.md)
* [详细说明：Nginx(ibas)](./running/ibas/nginx/README.md)
* [详细说明：Tomcat(ibas)](./running/ibas/tomcat/README.md)

## 鸣谢 | thanks
[牛加人等于朱](http://baike.baidu.com/view/1769.htm "NiurenZhu")<br>
[Color-Coding](http://colorcoding.org/ "咔啦工作室")<br>
