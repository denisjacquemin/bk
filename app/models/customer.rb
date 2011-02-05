class Customer < ActiveRecord::Base
  belongs_to :address
  belongs_to :sex
  belongs_to :civilstatus
  belongs_to :language
  belongs_to :nationality
  belongs_to :title
  belongs_to :company
  
  has_many :bills
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :sex
  accepts_nested_attributes_for :civilstatus
  accepts_nested_attributes_for :language
  accepts_nested_attributes_for :nationality
  accepts_nested_attributes_for :title
  
  def fullname
    "#{self.firstname} #{self.lastname}"
  end
  
  def fullname_with_reference
    "#{self.fullname} ref: #{self.reference}"
  end
end