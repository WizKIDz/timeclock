class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  before_action :sanitize_project_ids, only: [:update, :create];

  private
  def configure_permitted_parameters
    # It was recommended in the docs for devise to use their custom serializer, the other issue is that your naming conventions were off which mine were too because i had to look at stack overflow: you have to user key_id instead of key format
    devise_parameter_sanitizer.for(:sign_up) do |user_params|
      user_params.permit(:username, :password, :password_confirmation, :admin, project_ids: [])
    end
  end
	def sanitize_project_ids
		user_params = params["user"]
		user_params['project_ids'].delete_if{|p| p == ""}
	end

end
