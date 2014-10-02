class Circle < ActiveRecord::Base
  validates 	:name, 				presence: true, uniqueness: true
  validates 	:deadline, 		presence: true

  belongs_to	:producer,	foreign_key: "creator_id"
  has_many 		:remix
  has_many		:stem
end
