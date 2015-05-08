# # begin
# #   if redis_config
# #     redis = Redis.new(host: redis_config['host'], port: redis_config['port'])
# #     redis_options = {:redis_connection => redis}
# #     percentages_lb = Leaderboard.new('percentages', Leaderboard::DEFAULT_OPTIONS, redis_options)
# #   end
# #   rescue Exception=>ex
# #   Rails.logger.error ex.message
# #   # percentages_lb = Leaderboard.new('percentages', Leaderboard::DEFAULT_OPTIONS)
# # end
#
# begin
#   rails_env = Rails.env
#   # Load the redis.yml configuration file
#   redis_config = YAML.load_file(Rails.root + 'config/leaderboard_redis.yml')[rails_env]
#
#   # Connect to Redis using the redis_config host and port
#   if redis_config
#     redis = Redis.new(host: redis_config['host'], port: redis_config['port'])
#     redis_options = {:redis_connection => redis}
#     HIGHSCORE_LB = Leaderboard.new('highscores', Leaderboard::DEFAULT_OPTIONS, redis_options)
#   end
# rescue Exception=>ex
#   Rails.logger.error ex.message
# end
