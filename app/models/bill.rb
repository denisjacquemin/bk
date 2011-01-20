class Bill < ActiveRecord::Base
  belongs_to :customer
  has_many :products
  accepts_nested_attributes_for :products
  delegate :firstname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :lastname, :to => :customer, :prefix => true, :allow_nil => true
end
