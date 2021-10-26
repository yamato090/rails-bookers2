class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! #追記することで、ログインしていない場合はログイン画面に遷移する。
  before_action :configure_permitted_parameters, if: :devise_controller? #deviseコントローラが動いたら、configure_permitted_parametersを処理する。

  def after_sign_in_path_for(resource)
   	  user_path(resource)
  end
  def after_sign_out_path_for(resource)
      root_path
  end


  private
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end

end
