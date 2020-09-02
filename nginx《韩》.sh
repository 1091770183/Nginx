#!/bin/bash
echo "------------开始安装插件--------"
yum -y install gcc gcc-c++ zlib zlib-devel openssl openssl-devel pcre pcre-devel
echo "----------下载nginx安装包-----"
wget http://nginx.org/download/nginx-1.14.0.tar.gz 
echo "----------解压nginx安装包-------"
tar -zxvf nginx-1.14.0.tar.gz
echo “---------进入nginx目录--------”
cd nginx-1.14.0
echo "---------进行安装----------"
./configure && make && make install
echo "---------做个软连接 使得命令直接使用------"
ln -s /usr/local/nginx/sbin/* /usr/sbin 
echo "---------进行检测--------"
nginx -t 
read -p "是否需要启动nginx（输入Y/N启动，其他不启动）：" yourprint
if [ "$yourprint" == 'Y' ] || [ "$yourprint" == 'N' ] 
then
    /usr/local/nginx/sbin/nginx
    if [ $? -eq 0 ]
    then
        echo "启动成功,请访问: http://本机ip"
    else
        echo "启动失败，请查看异常信息确定失败原因"
    fi
else
    echo "不启动"
fi

