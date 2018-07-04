require 'rails_helper'
#require './app/services/skill_points_counter_service'

RSpec.describe SkillPointsCounterService do

  let(:skill1) {create(:skill, :parent)}
  let(:user1)  {create(:user)}
  let(:user2)  {create(:user)}

  before :each do
    skill1
    skill1.users += [user1, user2]
    @skill_point_counter = SkillPointsCounterService.new(skill1.id)
  end

  describe '#call' do

    let(:skill2) {create(:skill)}
    let(:user3)  {create(:user)}

    it "count skill's users' point" do
      skill_points_user = user1.points + user2.points
      expect(@skill_point_counter.call).to eq(skill_points_user)
    end

    it "counts subskill's users' points" do
      skill1.children.first.users << user3
      skill_points_user = user1.points + user2.points + user3.points
      expect(@skill_point_counter.call).to eq(skill_points_user)
    end

    it "does not cout other skills' users' point" do
      skill2.users << user3
      skill_points_users = user1.points + user2.points
      not_skill_points_users = skill_points_users + user3.points
      expect(@skill_point_counter.call).to_not eq(not_skill_points_users)
      expect(@skill_point_counter.call).to eq(skill_points_users)
    end

    # Deeper levels of children has been studied but judged as not relevant in this exercise

  end

end