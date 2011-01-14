class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_user_language
  
  private
    def set_user_language
      I18n.locale = 'fr'
    end
end
