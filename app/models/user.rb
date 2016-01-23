# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   has_and_belongs_to_many :projects
   devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
		 :registerable,
		 :recoverable,
         :authentication_keys => [:username]

  def email_required?
    false
  end

  # Helps to see if a user has been clocked in and hasnt clocked out yet
  def is_clocked_in
    @last_clocked_in = user.timekeepings.last
    if @last_clocked_in && @last_clocked_in.clock_out.nil?
      return @last_clocked_in
    else
      return nil
    end
  end

  def email_changed?
    false
  end
end
