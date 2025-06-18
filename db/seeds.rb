resume_path = Rails.root.join('lib', 'assets', 'texts', 'resume.txt')
resume_text = File.read(resume_path)
parsed_text = ResumeParserService.new(resume_text).call

# Experiences
parsed_text["experiences"].each do |exp|
  Experience.create!(
    title: exp["title"],
    company: exp["company"],
    location: exp["location"],
    description: exp["description"],
    start_date: exp["start_date"],
    end_date: exp["end_date"]
  )
end

# Skills
parsed_text["skills"].each do |skill_name|
  Skill.find_or_create_by!(name: skill_name)
end

# Projects
parsed_text["projects"].each do |proj|
  Project.create!(
    name: proj["name"],
    description: proj["description"],
    technologies: proj["technologies"],
    github_url: proj["github_url"],
    demo_url: proj["demo_url"],
    # optionally handle start_date, end_date if present
  )
end

# Optional: Link skills to experiences and projects if you have join models
# For example:

parsed_text["experience_skills"].each do |exp_skill|
  experience = Experience.find_by(title: exp_skill["experience_title"])
  next unless experience
  exp_skill["skills"].each do |skill_name|
    skill = Skill.find_or_create_by!(name: skill_name)
    experience.skills << skill unless experience.skills.include?(skill)
  end
end

parsed_text["project_skills"].each do |proj_skill|
  project = Project.find_by(name: proj_skill["project_name"])
  next unless project
  proj_skill["skills"].each do |skill_name|
    skill = Skill.find_or_create_by!(name: skill_name)
    project.skills << skill unless project.skills.include?(skill)
  end
end


# portfolio_text = File.read(Rails.root.join('lib/assets/texts/resume.txt'))
# parsed_text = ResumeParserService.new(portfolio_text).call

# # Create Experiences
# parsed_text["experiences"].each do |exp|
#   Experience.create!(
#     title: exp["title"],
#     company: exp["company"],
#     location: exp["location"],
#     description: exp["description"],
#     start_date: exp["start_date"],
#     end_date: exp["end_date"]
#   )
# end

# # Create Projects
# parsed_text["projects"].each do |proj|
#   Project.create!(
#     name: proj["name"],
#     description: proj["description"],
#     technologies: proj["technologies"],
#     github_url: proj["github_url"],
#     demo_url: proj["demo_url"]
#   )
# end

# # Create Skills
# parsed_text["skills"].each do |skill|
#   Skill.create!(
#     name: skill["name"]
#   )
# end
