require 'rails_helper'

RSpec.describe "SkillEntry" do
  it "exists" do
    attributes = { name: "Blah" }
    skill = Skill.new(attributes)

    expect(skill).to be_a Skill
  end
end