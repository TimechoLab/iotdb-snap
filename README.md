# iotdb-snap

 将Apache IoTDB封装成snap安装包。使用snap的方式安装Apache IoTDB无需配置JDK或者JRE。

## 安装方式

```shell
# 安装snap环境
sudo apt install snap snapd

# 安装IoTDB的snap包
sudo snap install apache-iotdb*.snap
```

## 打包方式

### 1. 将仓库clone到本地

```shell
git clone https://github.com/TimechoLab/iotdb-snap.git
```

### 2. 下载资源文件

由于Apache IoTDB与JRE的资源文件太大，无法将其放在源码中。所以只能将资源文件放在了仓库的releases里面。使用以下命令下载资源文件：

```shell
./install-env.sh
```

### 3. 安装虚拟环境

```shell
./install-venv.sh
```

### 4. 打包

由于JRE会根据CPU架构不同，提供不同的版本，所以我们也提供了amd64与arm64两种架构的安装包打包方式。

如果我们需要打包amd64架构的安装包，直接执行以下命令即可：

```
./build-snap-amd64.sh
```

如果我们需要打包arm64架构的安装包，我们需要先修改`snap/snapcraft.yaml`文件中的如下行：

```yaml
name: apache-iotdb # you probably want to 'snapcraft register <name>'
base: core20 # the base snap is the execution environment for this snap
version: 0.13.0 # just for humans, typically '1.2+git' or '1.3.2'
summary: Apache IoTDB v0.13.0 # 79 char long summary
description: |
  Apache IoTDB (Database for Internet of Things) is an IoT native database with high performance for data management and analysis, deployable on the edge and the cloud. Due to its light-weight architecture, high performance and rich feature set together with its deep integration with Apache Hadoop, Spark and Flink, Apache IoTDB can meet the requirements of massive data storage, high-speed data ingestion and complex data analysis in the IoT industrial fields.
grade: stable # must be 'stable' to release into candidate/stable channels
confinement: strict # use 'strict' once you have the right plugs and slots

apps:
  install-iotdb:
    command: bin/install_iotdb.py
    plugs:
      - network-bind
    daemon: simple

parts:
  iotdb:
    plugin: python
    source: .
  env:
    plugin: dump
    source: ./env-arm.tar.gz			# 将原来的./env-amd.tar.gz改为./env-arm.tar.gz
```

然后接着执行以下命令即可：

```shell
./build-snap-arm64.sh
```
