if Rails.env.production?
  uri = ENV["REDISTOGO_URL"]
else
  uri = "redis://localhost:6379"
end
Redis.current = Redis.new(:url => uri)

# REDIS_CONFIG = YAML.load_file(Rails.root.join('config', 'redis.yml'))[Rails.env]
# Redis.current = Redis.new(:driver => :hiredis,
#                           :host => REDIS_CONFIG['host'],
#                           :port => REDIS_CONFIG['port'],
#                           :db => REDIS_CONFIG['database'])
