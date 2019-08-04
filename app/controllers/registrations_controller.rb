class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    if params[:password].present? && params[:password_confirmation].present?
      super
    else
      params.delete(:current_password)
      resource.update(params)
    end
  end

  def after_update_path_for(resource)
    user_path(resource)
  end
end