uri = URI.parse(REDIS_HOST)
redis = Redis.new(host: uri.host, port: uri.port)

namespace = [Rails.application.class.parent_name, Rails.env].join ':'
Redis.current = Redis::Namespace.new(namespace, redis: redis)
