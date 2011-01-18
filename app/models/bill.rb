class Bill < ActiveRecord::Base
  belongs_to :customer
  delegate :firstname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :lastname, :to => :customer, :prefix => true, :allow_nil => true
end
