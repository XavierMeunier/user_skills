class ParentSkillInfoService

  def initialize
  end

  def get
    get_parent_skills_info
  end

private

  def get_parent_skills_info
    users_grouped_by_skills = User.all
                                  .select(:id, :points)
                                  .includes("skills")
                                  .group_by{|user| user.skills.first.parent || user.skills.first}

    users_grouped_by_skills.each{ |skill, users|
      users_grouped_by_skills[skill] = {
        points:       users.inject(0){|sum, user| sum + user.points},
        users_count:  users.count
      }
    }
  end

end