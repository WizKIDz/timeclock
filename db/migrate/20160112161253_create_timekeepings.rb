class CreateTimekeepings < ActiveRecord::Migration
  def change
    create_table :timekeepings do |t|
      t.datetime :clock_in
      t.datetime :clock_out

      t.timestamps null: false
    end
  end
end
