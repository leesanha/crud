class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # sign_up할때 username 중복을 막는다.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    # 내 정보를 수정할 때 같은 아이디로 수정이 안되는 것을 막음
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
