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
  
  validates :firstname, :lastname, :reference, :presence => true
  validates_uniqueness_of :reference
  
  
  scope :by_company, lambda { |company_id| where("company_id = ?", company_id) }
  scope :active, where('deleted = ?', false)
  
  def fullname
    "#{self.firstname} #{self.lastname}"
  end
  
  def fullname_with_underscore
    self.fullname.gsub(' ', '_')
  end
  
  def fullname_with_reference
    "#{self.fullname} ref: #{self.reference}"
  end
end