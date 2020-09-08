class ApplicationController < ActionController::Base
    # ユーザーがページにアクセスする前に、これを呼び出す
    before_action :configure_permitted_parameters, if: :devise_controller?
    # このコントローラ内でしか呼ばれないようにする
    private
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
