class Tva < ActiveRecord::Base
  has_many :products
  belongs_to :company
  
  scope :by_company, lambda { |company_id| where("company_id = ? or company_id = 0", company_id) }
  scope :ordered, order('sort')
  
end
