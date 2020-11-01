class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_user_can_edit?, :event_has_current_subscriber?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[password password_confirmation current_password])
  end

  def current_user_can_edit?(model)
    user_signed_in? && (model.user == current_user || (model.try(:event).present? && model.event.user == current_user))
  end

  # Метод, который проверяет, имеет ли текущий авторизованный пользователь подписку на событие.
  # Если такой пользователь не подписан на событие, то в шаблоне views/events/show.html.erb
  # предоставить возможность подписаться на событие, иначе убрать такую возможность.
  def event_has_current_subscriber?(event)
    current_user == event.subscribers.find_by(id: current_user.id) if current_user
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
