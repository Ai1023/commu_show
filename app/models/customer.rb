class Customer < ApplicationRecord

  has_many :games, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :event_calenders, dependent: :destroy
  has_many :join_events, dependent: :destroy

  # フォローしている人
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローされている人
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 架空のテーブル名を使用しそれぞれのデータを取得
  # 自分がフォローされている人
  has_many :follower_customer, through: :follower, source: :follower
  # 自分がフォローしている人
  has_many :following_customer, through: :followed, source: :followed

  # ユーザーをフォローする
  def follow(customer_id)
    follower.create(followed_id: customer_id)
  end

  # ユーザーのフォローを外す
  def unfollow(customer_id)
    follower.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    following_customer.include?(customer)
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
