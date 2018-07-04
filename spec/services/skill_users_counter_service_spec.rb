require 'rails_helper'
#require './app/services/skill_users_counter_service'

RSpec.describe SkillUsersCounterService do

  let(:skill1) {create(:skill, :parent)}
  let(:user1)  {create(:user)}
  let(:user2)  {create(:user)}

  before :each do
    skill1
    skill1.users += [user1, user2]
    @skill_users_counter = SkillUsersCounterService.new(skill1.id)
  end

  describe '#call' do

    let(:skill2) {create(:skill)}
    let(:user3)  {create(:user)}

    it "count skill's users" do
      expect(@skill_users_counter.call).to eq(2)
    end

    it "counts subskill's users" do
      skill1.children.first.users << user3
      expect(@skill_users_counter.call).to eq(3)
    end

    it "does not count other skills' users" do
      skill2.users << user3
      expect(@skill_users_counter.call).to_not eq(3)
      expect(@skill_users_counter.call).to eq(2)
    end

    # Deeper levels of skill children has been studied but judged as not relevant in this exercise

  end

end