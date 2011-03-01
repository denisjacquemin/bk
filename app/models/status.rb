class Status < ActiveRecord::Base
  
  scope :all_active_ordered, where("active = 1").order("sort")
end
