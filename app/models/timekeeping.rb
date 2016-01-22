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
end
