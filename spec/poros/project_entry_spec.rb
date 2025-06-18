require 'rails_helper'

RSpec.describe "ProjectEntry" do
  it "exists" do
    attributes = { name: "Portfolio", description: "Showing my work", technologies: "Ruby, Rails, ActiveRecord", github_url: "website.com", demo_url: "demo.com" }
    project = Project.new(attributes)

    expect(project).to be_a Project
  end
end