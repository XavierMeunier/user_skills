class SkillUsersCounterService
  include ActiveModel::Validations

  validates :skill, presence: true

  attr_reader :skill

  def initialize(skill_id)
    @skill = Skill.find(skill_id)
  end

  # Deeper levels of skill child has been studied but judged as not relevant in this exercise
  def call
    count_skill_users
  end

private

  def count_skill_users
    User.includes(:skills)
      .where(skills: {parent_id: skill.id})
    .or(User.includes(:skills)
      .where(skills: {id: skill.id}))
    .count
  end

end