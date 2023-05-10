class EventCalender < ApplicationRecord
  
  has_many :join_events, dependent: :destroy
  belongs_to :customer
  
end
