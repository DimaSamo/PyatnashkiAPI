class Leaderboard < ApplicationRecord
    scope :sorted, -> {order(moves: :asc).limit(50)}
end
