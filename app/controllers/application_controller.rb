class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :login_required
  before_filter :set_user_language
  
  private
    def set_user_language
      I18n.locale = 'fr'
    end
    
    def login_required
      unless user_signed_in? or ['sessions'].include? controller_name
        authenticate_user!
      end
    end
end
