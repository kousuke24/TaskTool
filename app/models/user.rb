class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 30 }
  validates :password, length: { maximum: 30 }

  before_destroy :delete_admin

  has_many :tasks, dependent: :destroy

  def delete_admin
    @admin_users = User.where(admin_flag: true)
    if @admin_users.count > 1
      destroy
    else
      errors.add :base, "管理者は最低1人必要です"
      throw :abort
    end
  end
end
