require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should validate_presence_of(:points) }
  it { should validate_numericality_of(:points) }

end
