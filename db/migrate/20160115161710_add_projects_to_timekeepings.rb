class AddProjectsToTimekeepings < ActiveRecord::Migration
  def change
    add_reference :timekeepings, :project, index: true, foreign_key: true
  end
end
