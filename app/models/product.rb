class Product < ActiveRecord::Base
  belongs_to :bill
  belongs_to :tva
  
  composed_of :totaltvac,
              :class_name => "Money",
              :mapping => %w(totaltvac_in_cents cents),
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money::Currency.new(:eur)) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }

  composed_of :totalhtva,
              :class_name => "Money",
              :mapping => %w(totalhtva_in_cents cents),
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money::Currency.new(:eur)) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
              
  composed_of :price,
              :class_name => "Money",
              :mapping => %w(price_in_cents cents),
              :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money::Currency.new(:eur)) },
              :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
  
  validates_numericality_of :totaltvac, :totalhtva, :quantity
  
  delegate :value, :to => :tva, :prefix => true, :allow_nil => true
end
