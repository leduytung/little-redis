class Commands
  SET = 'set'
  GET = 'get'
  STRING_CASE = [SET, GET]

  LLEN = 'llen'
  RPUSH = 'rpush'
  LPOP = 'lpop'
  RPOP = 'rpop'
  LRANGE = 'lrange'
  LIST_CASE = [LLEN, RPUSH, LPOP, RPOP, LRANGE]

  SADD = 'sadd'
  SCARD = 'scard'
  SMEMBERS = 'smembers'
  SREM = 'srem'
  SINTER = 'sinter'
  SET_CASE = [SADD, SCARD, SMEMBERS, SREM, SINTER]

  KEYS = 'keys'
  DEL = 'del'
  FLUSHDB = 'flushdb'
  EXPIRE = 'expire'
  TTL = 'ttl'
  EXPIRE_CASE = [KEYS, DEL, FLUSHDB, EXPIRE, TTL]

  SAVE = 'save'
  RESTORE = 'restore'
  SNAPSHOT_CASE = [SAVE, RESTORE]

end