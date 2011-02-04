class Company < ActiveRecord::Base
  has_many :users
  has_many :customers
  belongs_to :address
  
  accepts_nested_attributes_for :address
end
