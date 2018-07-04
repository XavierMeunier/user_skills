module UsersHelper

  def user_skill_name(user)
    user.user_skill.blank? ? "" : user.user_skill.name
  end
  
  def user_skill_id(user)
    user.user_skill.blank? ? nil : user.user_skill.id
  end

end