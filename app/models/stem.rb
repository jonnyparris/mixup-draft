class Stem < ActiveRecord::Base  
  validates :download_url, 	presence: true, uniqueness: true
  validates :track_name, 		presence: true
  validates :producer, 			presence: true
  
  belongs_to 	:producer

  has_many		:remixes
  has_many		:circles, through: :remixes
end
