module Boards
  DEFAULT_BOARD = 'percentage_lb'

  def self.default_leaderboard
    TieRankingLeaderboard.new(
    DEFAULT_BOARD,
    default_options,
    redis_connnection: Redis.current
    )
  end

  def self.default_options
    Leaderboard::DEFAULT_OPTIONS.merge(
    page_size: 150
    )
  end

  class Base
    def leaderboard
      @leaderboard ||= Boards.default_leaderboard
    end

    def member_exists?(name)
      leaderboard.check_member?(name)
    end
  end
end
