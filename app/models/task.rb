class Task < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 30 }

  validates :content, length: { maximum: 250 }
end
