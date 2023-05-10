class Customer < ApplicationRecord

  has_many :games, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :event_calenders, dependent: :destroy
  has_many :join_events, dependent: :destroy

  # フォローした、されたのリレーション
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 架空のテーブル名を使用しそれぞれのデータを取得
  # 自分をフォローしている人
  has_many :followers, through: :relationships, source: :follower
  # 自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

  # 顧客IDが存在するかどうかのメゾット
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
