uri = ENV["REDISCLOUD_URL"] || "redis://localhost:6379/"
Redis.current = Redis.new(:url => uri)
