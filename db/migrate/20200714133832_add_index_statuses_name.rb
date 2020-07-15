class AddIndexStatusesName < ActiveRecord::Migration[5.2]
  def change
    add_index :statuses, :name
  end
end
