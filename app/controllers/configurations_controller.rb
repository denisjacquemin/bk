class ConfigurationsController < ApplicationController
  def index
    if current_user.tutorial_step == 1
      current_user.tutorial_step = 2
      current_user.save
    end
    @company = current_user.company
  end
end
