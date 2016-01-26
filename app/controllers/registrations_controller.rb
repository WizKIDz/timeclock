class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
  
  private
  def configure_permitted_parameters
    # It was recommended in the docs for devise to use their custom serializer, the other issue is that your naming conventions were off which mine were too because i had to look at stack overflow: you have to user key_id instead of key format
    devise_parameter_sanitizer.for(:sign_up) do |user_params|
      user_params.permit(:username, :first_name, :last_name, :password, :password_confirmation, :admin, project_ids: [])
    end
	
	devise_parameter_sanitizer.for(:account_update) do |user_params|
		user_params.permit(:username, :first_name, :last_name, :password, :password_confirmation, :admin, project_ids: [])
	end
  end
end
