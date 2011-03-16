class ConfigurationsController < ApplicationController
  def index
    @company = current_user.company
  end
end
