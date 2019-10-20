require 'pry'
class LeaderboardsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        # binding.pry
        leaderboards = Leaderboard.all.sorted
        render json: leaderboards
    end

    def create
        #binding.pry
        lb = Leaderboard.new(leaderboard_params)
        if lb.save
            render json: {status:200, message: "Leaderboard entry added."}
        else
            render json: {status: 500, message: "Failed to add entry."}
        end
    end


    private

    def leaderboard_params
      params.require(:leaderboard).permit(:name, :moves)
    end

end
