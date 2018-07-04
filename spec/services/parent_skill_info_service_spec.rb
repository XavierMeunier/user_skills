require 'rails_helper'
#require './app/services/parent_skill_info_service'

RSpec.describe ParentSkillInfoService do

  # Skill 1
  let(:skill1) {create(:skill, :parent)}
  let(:user1)  {create(:user)}
  let(:user2)  {create(:user)}
  # Subskill 1
  let(:user3)  {create(:user)}
  # Skill 2
  let(:skill2) {create(:skill)}
  let(:user4)  {create(:user)}

  before :each do
    skill1
    skill1.users += [user1, user2]
    skill1.children.first.users << user3
    skill2.users << user4
    @parent_skill_info = ParentSkillInfoService.new
  end

  describe '#get' do
    let(:skill1_points) {user1.points + user2.points + user3.points}
    let(:skill2_points) {user4.points}

    let(:perfect_hash) {
      {
        skill1 => {
          points: skill1_points,
          users_count: 3
        },
        skill2 => {
          points: skill2_points,
          users_count: 1          
        }
      }
    }

    it "return a perfect hash" do
      puts perfect_hash
      expect(@parent_skill_info.get).to eq(perfect_hash)
    end

  end

end