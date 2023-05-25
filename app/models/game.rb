class Game < ApplicationRecord

  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :game_tags, dependent: :destroy
  has_many :tags, through: :game_tags

  # 顧客IDが存在するかどうかのメゾット
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["game_body"]
  end


end
