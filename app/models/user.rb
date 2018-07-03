class User < ApplicationRecord

  validates :points, :numericality => true

end