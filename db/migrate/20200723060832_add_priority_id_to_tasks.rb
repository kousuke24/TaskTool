class AddPriorityIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :priority_id, :integer
  end
end
