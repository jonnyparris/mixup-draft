class Producer < ActiveRecord::Base
  # Remember to create a migration!
  validates :producer_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :stems
  has_many :remixes
  has_many :circles, through: :remixes
end
