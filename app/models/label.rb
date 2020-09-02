class Label < ApplicationRecord
  has_many :tasks_labels_relation
  has_many :tasks, through: :tasks_labels_relation
end
