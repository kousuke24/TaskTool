class ChangeTasksContentLimit250 < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :tasks, :content, :string, limit:250
    end

    def down
      change_column :tasks, :content, :string
    end
  end
end
