class AddStatusToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :status, :boolean
  end
end
