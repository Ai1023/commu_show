class Customer < ApplicationRecord

  has_many :games, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :join_events, dependent: :destroy

  # follower_id=自分
  # followed_id=相手
  # 架空のテーブル名を使用しそれぞれのデータを取得

  # 自分がフォローする、外す
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロー一覧表記
  has_many :followings, through: :relationships, source: :followed

  # 自分がフォローされている
  has_many :reverse_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # フォロワー一覧
  has_many :followers, through: :reverse_relationships, source: :follower

  # ユーザーをフォローする
  def follow(customer_id)
    relationships.create(followed_id: customer_id)
  end

  # ユーザーのフォローを外す
  def unfollow(customer_id)
    relationships.find_by(followed_id: customer_id).destroy
  end

  def following?(customer)
    followings.include?(customer)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["nickname"]
  end
   
  # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないよう制約を設ける
  def active_for_authentication?
    super && (is_active == true)
  end

  def is_deleted
    !is_active
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
