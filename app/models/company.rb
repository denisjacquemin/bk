class Company < ActiveRecord::Base
  has_many :users
  has_many :customers
  belongs_to :address
  has_many :bankaccounts
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :bankaccounts, :allow_destroy => true
end
