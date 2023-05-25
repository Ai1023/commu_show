class Event < ApplicationRecord

  has_many :join_events, dependent: :destroy
  belongs_to :customer

  def end_time
    self.finish_time
  end

end
