module Boards
  # DEFAULT_BOARD = 'percentage_lb'

  def self.students_leaderboard
    TieRankingLeaderboard.new('students_lb', Leaderboard::DEFAULT_OPTIONS.merge(page_size: 100), redis_connnection: Redis.current)
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
