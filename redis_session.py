'''
Redis-backed web.py session store. Dependencies are web.py and redis-py
'''

from web.session import Store
import time

class RedisStore(Store):
    def __init__(self, name, redis):
        self.storename = name+":store"
        self.timename = name+":time"
        self.redis = redis
    def __contains__(self, key):
        return self.redis.hexists(self.storename,key)
    def __getitem__(self, key):
        pickled = self.redis.hget(self.storename, key)
        if pickled:
            return self.decode(pickled)
        return None
    def __setitem__(self, key, value):
        pickled = self.encode(value)
        self.redis.hset(self.storename, key, pickled)
        self.redis.hset(self.timename, key, time.time())
    def __delitem__(self, key):
        self.redis.hdel(self.storename, key)
        self.redis.hdel(self.timename, key)
    def cleanup(self, timeout):
        now = time.time()
        for key in self.redis.hkeys(self.storename):
            keytime = self.redis.hget(self.timename, key)
            keytime = float(keytime)
            if now - keytime > timeout:
                self.redis.hdel(self.storename, key)
                self.redis.hdel(self.timename, key)
