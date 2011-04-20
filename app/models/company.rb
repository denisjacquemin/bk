class Company < ActiveRecord::Base
  has_many :users
  has_many :customers
  belongs_to :address
  has_many :bankaccounts
  has_many :tvas
  has_many :bills
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :bankaccounts, :allow_destroy => true
  accepts_nested_attributes_for :tvas
end
