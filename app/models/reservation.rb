class Reservation < ApplicationRecord
  belongs_to :user

  enum reservation_type: { first: 0, repeate: 1}
end
