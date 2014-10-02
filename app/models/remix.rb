class Remix < ActiveRecord::Base
  validates	:circle, 				presence: true
  validates	:stem, 					presence: true
  validates :download_url,	uniqueness: true

  belongs_to	:producer, 		foreign_key: "remixer_id"
  belongs_to	:circle
  belongs_to	:stem
end
