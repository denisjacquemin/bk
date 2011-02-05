class Bill < ActiveRecord::Base
  belongs_to :customer
  has_many :products
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  
  
  accepts_nested_attributes_for :products, :allow_destroy => true
  delegate :firstname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :lastname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :email, :to => :author, :prefix => true, :allow_nil => true
  delegate :fullname_with_reference, :to => :customer, :prefix => true, :allow_nil => true
  
  
end
