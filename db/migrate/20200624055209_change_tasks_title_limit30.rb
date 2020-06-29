class ChangeTasksTitleLimit30 < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :tasks, :title, :string, limit:30
    end

    def down
      change_column :tasks, :title, :string
    end
  end
end
