class Customer < ActiveRecord::Base
  belongs_to :address
  belongs_to :sex
  belongs_to :civilstatus
  belongs_to :language
  belongs_to :nationality
  belongs_to :title
  
  has_many :folders
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :sex
  accepts_nested_attributes_for :civilstatus
  accepts_nested_attributes_for :language
  accepts_nested_attributes_for :nationality
  accepts_nested_attributes_for :title
end