class SkillPointsCounterService
  include ActiveModel::Validations

  validates :skill, presence: true

  attr_reader :skill

  def initialize(skill_id)
    @skill = Skill.find(skill_id)
  end

  def call
    own_points = count_users_points
    childen_points = count_children_skills_users_points
    own_points + childen_points
  end

  def count_users_points
    skill.users.map(&:points).sum
  end

  def count_children_skills_users_points
    skill.children.ids.map{ |child_skill_id|
      child_points = SkillPointsCounterService.new(child_skill_id)
      child_points.call
    }.sum
  end

end