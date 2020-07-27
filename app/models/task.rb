class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, length: { maximum: 250 }

  belongs_to :status
  belongs_to :priority
end
