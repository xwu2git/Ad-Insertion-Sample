#!/usr/bin/python3

from kazoo.client import KazooClient
from kazoo.exceptions import NoNodeError, NodeExistsError
import json

ZK_HOSTS='zookeeper:2181'

class ZKData(object):
    def __init__(self):
        super(ZKData,self).__init__()
        self._zk=KazooClient(hosts=ZK_HOSTS)
        self._zk.start()

    def set(self, path, value):
        value=json.dumps(value).encode('utf-8')
        try:
            self._zk.create(path, value, makepath=True)
        except NodeExistsError:
            pass

    def get(self, path):
        try:
            value, stat= self._zk.get(path)
            if not value: return {}
            return json.loads(value.decode('utf-8'))
        except Exception as e:
            return {}

    def close(self):
        self._zk.stop()
        self._zk.close()
