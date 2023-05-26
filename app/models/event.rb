class Event < ApplicationRecord

  has_many :join_events, dependent: :destroy

  def end_time
    self.finish_time
  end

end
