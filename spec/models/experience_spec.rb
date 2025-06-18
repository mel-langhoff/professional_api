require 'rails_helper'

RSpec.describe ExperienceSkill, type: :model do
  describe 'relationships' do
    it { should belong_to(:experience) }
    it { should belong_to(:skill) }
  end
end
