# Load resume text and parse it
puts "🌱 Running seeds..."

resume_path = Rails.root.join('lib', 'assets', 'texts', 'resume.txt')
puts "Resume path: #{resume_path}"
puts "File exists? #{File.exist?(resume_path)}"

resume_text = File.read(resume_path)
puts "Resume text loaded: #{resume_text[0..100]}..."  # show preview

parsed_text = ResumeParserService.new(resume_text).call
puts "Parsed text keys: #{parsed_text.keys}"
# resume_path = Rails.root.join('lib', 'assets', 'texts', 'resume.txt')
# resume_text = File.read(resume_path)
# parsed_text = ResumeParserService.new(resume_text).call

# Seed Experiences
puts "Seeding experiences..."

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

# Seed Skills
puts "Seeding skills..."

parsed_text["skills"].each do |skill_name|
  Skill.find_or_create_by!(name: skill_name)
end

# Seed Projects
puts "Seeding projects..."

parsed_text["projects"].each do |proj|
  Project.create!(
    name: proj["title"],
    description: proj["description"],
    technologies: proj["tech"],
    github_url: proj["git_repo"],
    demo_url: proj["demo_link"]
  )
end

# Link skills to experiences
puts "Seeding experience skills..."

parsed_text["experience_skills"].each do |exp_skill|
  if exp_skill.is_a?(Hash)
    experience = Experience.find_by("LOWER(title) = ?", exp_skill["experience_title"].downcase)
    next unless experience

    exp_skill["skills"].each do |skill_name|
      skill = Skill.find_or_create_by!(name: skill_name)
      experience.skills << skill unless experience.skills.include?(skill)
    end
  else
    puts "⚠️ Skipping invalid experience_skill: #{exp_skill.inspect}"
  end
end




# Link skills to projects
puts "Seeding project skills..."

parsed_text["project_skills"].each do |proj_skill|
  project = Project.find_by(name: proj_skill["project_title"])
  next unless project
  proj_skill["skills"].each do |skill_name|
    skill = Skill.find_or_create_by!(name: skill_name)
    project.skills << skill unless project.skills.include?(skill)
  end
end

puts "Seeding complete!"
