module SkillsHelper

  def parent_name(skill)
    skill.parent.blank? ? "" : skill.parent.name
  end

end