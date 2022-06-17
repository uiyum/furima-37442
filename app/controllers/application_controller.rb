class ApplicationController < ActionController::Base
    before_action :basic_auth
    before_action :configre_permitted_parameters, if: :devise_controller?
    

    private
    def basic_auth
        authenticate_or_request_with_http_basic do |username,password|
            username == 'admin' && password == '0000'
        end
    end

    def configre_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
    end
end
