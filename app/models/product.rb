class Product < ActiveRecord::Base
  belongs_to :bill
  belongs_to :tva
  
  delegate :value, :to => :tva, :prefix => true, :allow_nil => true
  
  validates_numericality_of :unit_price, :quantity
end
