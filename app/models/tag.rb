class Tag < ApplicationRecord
  
  has_many :game_tags, dependent: :destroy
  has_many :games, through: :game_tags
  
end
