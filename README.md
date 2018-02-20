拉取mqtt镜像
docker pull zlee/mqtt:latest

启动mqtt
docker run -d --name="mqtt" -h="mqtt" -p 1883:1883 zlee/mqtt:latest

进入容器
docker exec -it Mqtt bash

更改mqtt设置
vi /etc/mosquitto/mosquitto.conf

添加如下内容
allow_anonymous false
password_file /etc/mosquitto/pwfile

添加用户并设置密码
mosquitto_passwd -c /etc/mosquitto/pwfile hass

重启容器
docker restart mqtt

mqtt测试
mosquitto_sub -d -u mqtt -P mqtt -t dev/test
mosquitto_pub -d -u mqtt -P mqtt -t dev/test -m "hello world"
