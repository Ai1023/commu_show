class PostComment < ApplicationRecord

  belongs_to :customer
  belongs_to :game

  #バリデーション
  validates :game_comment, presence: true

end
