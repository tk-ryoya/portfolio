class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 500 }
end
