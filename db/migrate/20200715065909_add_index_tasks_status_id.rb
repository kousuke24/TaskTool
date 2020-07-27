class AddIndexTasksStatusId < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, :status_id
  end
end
