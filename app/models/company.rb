class Company < ActiveRecord::Base
  has_many :users
  has_many :customers
  belongs_to :address
  has_many :bankaccounts
  has_many :tvas
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :bankaccounts, :allow_destroy => true
  accepts_nested_attributes_for :tvas
  
  def completed?
    complete = true
    complete = false if name.nil? 
    complete = false if address.nil? 
    complete = false if address.city.nil?
    complete = false if address.street.nil?
    complete
  end
end
