class Customer < ActiveRecord::Base
  belongs_to :address
  belongs_to :title
  belongs_to :company
  
  has_many :bills
  
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :title
  
  delegate :city, :to => :address, :prefix => true, :allow_nil => true
  
  validates_uniqueness_of :reference, :presence => true
  validates_presence_of :firstname, :lastname, :if => "customer_type == 1"
  validates_presence_of :company_name, :if => "customer_type == 2"
  
  scope :by_company, lambda { |company_id| where("company_id = ?", company_id) }
  scope :active, where('deleted = ?', false)
  scope :latest, order('updated_at desc')
  
  def number_of_bills_late
    bills.where('status=3').active.count
  end
  
  def number_of_bills_sent
    bills.where('status=1').active.count
  end
  
  def fullname
    if customer_type == 1
      "#{self.firstname} #{self.lastname}"
    elsif customer_type == 2
      company_name
    end
  end
  
  def fullname_with_underscore
    self.fullname.gsub(' ', '_')
  end
  
  def fullname_with_reference
    "#{self.fullname} (ref: #{self.reference})"
  end
end