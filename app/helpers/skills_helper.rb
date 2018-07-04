module SkillsHelper

  def parent_name(skill)
    skill.parent.blank? ? "" : skill.parent.name
  end

  def check_available_users_text(users)
    @users.present? ? "Available users" : "No available users"
  end

end