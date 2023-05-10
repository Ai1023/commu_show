class JoinEvent < ApplicationRecord

  belongs_to :customer
  belongs_to :event_calender

end
