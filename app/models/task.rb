class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, length: { maximum: 250 }

  belongs_to :status
  belongs_to :priority
  belongs_to :user, counter_cache: true

  has_many :tasks_labels_relation
  has_many :labels, through: :tasks_labels_relation
end
