class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :bills
  belongs_to :company
  
  # Associate a new user with a company
  before_create :associate_with_company
  
  def associate_with_company
    company = Company.create
    company.address = Address.create
    company.save
    self.company = company
  end
  
end
