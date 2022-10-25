from os import listdir, system, getcwd

class IoTDBInstaller:
    working_directory = getcwd()
    resource_path = "/" + "/".join(working_directory.split('/')[2:])
    iotdb_directory = "apache-iotdb-0.13.0-all-bin"

    def install(self):
        system("cp -r %s ./" % (self.resource_path + '/' + self.iotdb_directory))
        system("chmod -R +xw ./apache-iotdb-0.13.0-all-bin")

    def has_installed(self):
        if self.iotdb_directory in listdir('./'):
            return True
        return False

    def start_iotdb(self):
        system("./apache-iotdb-0.13.0-all-bin/sbin/start-server.sh")
