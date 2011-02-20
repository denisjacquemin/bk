class Bill < ActiveRecord::Base
  belongs_to :customer
  has_many :products
  belongs_to :author, :class_name => "User", :foreign_key => "author_id"
  
  composed_of :totaltvac,
              :class_name => "Money",
              :mapping => %w(totaltvac_in_cents cents),
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  composed_of :totalhtva,
              :class_name => "Money",
              :mapping => %w(totalhtva_in_cents cents),
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  
  validates_numericality_of :totaltvac, :totalhtva
  validates :name, :reference, :presence => true
  validates_uniqueness_of :reference
  
  accepts_nested_attributes_for :products, :allow_destroy => true
  delegate :firstname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :lastname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :fullname, :to => :customer, :prefix => true, :allow_nil => true
  delegate :fullname_with_underscore, :to => :customer, :prefix => true, :allow_nil => true
  delegate :email, :to => :author, :prefix => true, :allow_nil => true
  delegate :fullname_with_reference, :to => :customer, :prefix => true, :allow_nil => true
  
  scope :by_company, lambda { |company_id| where("company_id = ?", company_id) }
  
end
