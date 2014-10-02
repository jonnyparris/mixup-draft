class Circle < ActiveRecord::Base
  validates 	:name, 								presence: true, uniqueness: true
  validates 	:signup_deadline, 		presence: true
  validates 	:submit_deadline, 		presence: true

  belongs_to	:producer,	foreign_key: "creator_id"
  has_many 		:remix
  has_many		:stem
end
