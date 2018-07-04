class User < ApplicationRecord

  # Currently limited to one skill in database
  has_and_belongs_to_many :skills

  validates :points, presence: true, numericality: true

  scope :without_skills, -> {
    joins("LEFT JOIN skills_users ON users.id = skills_users.user_id")
    .where("skills_users.user_id IS NULL")
  }
  scope :with_skills, -> { where.not(id: without_skills) }

  def user_skill
    self.skills.first
  end

end