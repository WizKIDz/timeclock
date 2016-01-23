# == Schema Information
#
# Table name: timekeepings
#
#  id         :integer          not null, primary key
#  clock_in   :datetime
#  clock_out  :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#

class Timekeeping < ActiveRecord::Base
  # validate that a user is assigned and also a project is assigned to an instance before save
  validates :project, :user, presence: true
  belongs_to :user
  belongs_to :project
end
