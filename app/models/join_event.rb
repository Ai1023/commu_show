class JoinEvent < ApplicationRecord

  belongs_to :customer
  belongs_to :event

end
