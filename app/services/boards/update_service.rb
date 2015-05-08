module Boards
  class UpdateService < Boards::Base
    def execute(user)
      name = user.first_name
      score = user.percentages
      leaderboard.rank_member(name, score)
      member = leaderboard.score_and_rank_for(name)
      member[:page] = leaderboard.page_for(name, leaderboard.page_size)
      member
    end
  end
end
