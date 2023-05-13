class Game < ApplicationRecord

  belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 顧客IDが存在するかどうかのメゾット
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

end
