class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_time_zone, if: :devise_controller?
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  # def I18n.t(code, options = {})
  #   begin
  #     message_code = code
  #     normal_translated = super message_code, options
  #     translated = eval("\"#{normal_translated}\"")
  #     return translated
  #   rescue SyntaxError => ex
  #     return normal_translated
  #   end.
  # end
  # nozomi added definition above to be able to use erb inside yml file


  private

  # def set_time_zone
  #   Time.zone = current_user.time_zone
  # end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def after_sign_in_path_for(resource)
    lessons_path
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
