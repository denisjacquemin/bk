class Address < ActiveRecord::Base
  has_many :customers
  has_many :companies
  
  belongs_to :country
  accepts_nested_attributes_for :country
end
