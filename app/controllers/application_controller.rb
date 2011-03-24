class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login_required
  before_filter :set_user_language
  
  rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert => t('assur.exception.not_authorized_access')
  end
  
  private
    def set_user_language
      I18n.locale = 'fr'
    end
    
    def login_required
      unless user_signed_in? or ['sessions', 'passwords', 'registrations', 'confirmations'].include? controller_name
        authenticate_user!
      end
    end
end
