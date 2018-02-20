1.拉取mqtt镜像
docker pull zlee/mqtt:latest

2.启动mqtt
docker run -d --name="mqtt" -h="mqtt" -p 1883:1883 zlee/mqtt:latest

3.进入容器
docker exec -it Mqtt bash

4.更改mqtt设置
vi /etc/mosquitto/mosquitto.conf

5.添加如下内容
allow_anonymous false
password_file /etc/mosquitto/pwfile

6.添加用户并设置密码
mosquitto_passwd -c /etc/mosquitto/pwfile hass

7.重启容器
docker restart mqtt

8.mqtt测试
mosquitto_sub -d -u mqtt -P mqtt -t dev/test
mosquitto_pub -d -u mqtt -P mqtt -t dev/test -m "hello world"
