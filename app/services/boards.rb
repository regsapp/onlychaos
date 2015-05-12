module Boards
  # DEFAULT_BOARD = 'percentage_lb'

  def connection
    redis_connection: Redis.current
  end

  def self.students_leaderboard
    TieRankingLeaderboard.new('students_lb', Leaderboard::DEFAULT_OPTIONS.merge(page_size: 100), connection)
  end

  class Base
    def leaderboard
      @leaderboard ||= Boards.students_leaderboard
    end

    def member_exists?(name)
      leaderboard.check_member?(name)
    end
  end
end
