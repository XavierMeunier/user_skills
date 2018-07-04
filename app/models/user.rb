class User < ApplicationRecord

  # Currently limited to one skill in database
  has_and_belongs_to_many :skills

  validates :points, presence: true, numericality: true

end