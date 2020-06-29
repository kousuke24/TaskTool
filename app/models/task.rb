class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }

  validates :content, length: { maximum: 250 }
end
