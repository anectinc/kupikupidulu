require 'redis'

uri = URI.parse(REDIS_HOST)
REDIS = Redis.new(host: uri.host, port: uri.port)
