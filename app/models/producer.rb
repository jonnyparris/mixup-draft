class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Producer < ActiveRecord::Base
  validates :email, 				presence: true, uniqueness: true,		email: true
  validates :producer_name, presence: true, uniqueness: true
  validates :password, 			presence: true, confirmation: true
  validates :password_hash, presence: true
  
  has_many :stems
  has_many :remixes
  has_many :circles, through: :remixes

  
  include BCrypt

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password  	
  end
end
