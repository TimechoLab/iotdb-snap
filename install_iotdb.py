#!/usr/bin/env python3
from app.iotdb_installer import IoTDBInstaller

installer = IoTDBInstaller()
if installer.has_installed() is False:
    installer.install()
installer.start_iotdb()