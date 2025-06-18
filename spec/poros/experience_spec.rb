require 'rails_helper'

RSpec.describe "Experience" do
  it "exists" do
    attributes = { title: "Blah", company: "Company", location: "Remote", description: "A job", start_date: Date.yesterday, end_date: Date.today }
    experience = Experience.new(attributes)

    expect(experience).to be_a Experience
  end
end