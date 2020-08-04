class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 30 }
  validates :password, length: { maximum: 30 }

  has_many :tasks, dependent: :destroy
end
