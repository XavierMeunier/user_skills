class SkillPointsCounterService
  include ActiveModel::Validations

  validates :skill, presence: true

  attr_reader :skill

  def initialize(skill_id)
    @skill = Skill.find(skill_id)
  end

  # Deeper levels of child has been studied but judged as not relevant in this exercise
  def call
    skills_to_count = skill.child_ids + [skill.id]
    count_skills_points(skills_to_count)
  end

private
  def count_skills_points(skill_ids)
    skill_ids.map{ |skill_id|
      count_users_points(skill_id)
    }.sum
  end

  def count_users_points(skill_id)
    current_skill = Skill.find(skill_id)
    current_skill.users.map(&:points).sum
  end

end