class AddUserIdToTimekeepings < ActiveRecord::Migration
  def change
    add_column :timekeepings, :user_id, :integer
    add_index :timekeepings, :user_id
  end
end
