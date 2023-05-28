class Event < ApplicationRecord

  has_many :join_events, dependent: :destroy
  
  #バリデーション
  validates :event_title, presence: true
  validates :event_body, presence: true

  # カレンダー機能
  def end_time
    self.finish_time
  end

  def join_event_by?(customer)
    join_events.exists?(customer_id: customer.id)
  end

end
