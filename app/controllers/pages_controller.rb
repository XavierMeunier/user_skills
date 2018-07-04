class PagesController < ApplicationController

  def home
    @parent_skills_info = ParentSkillInfoService.new.get
  end


end