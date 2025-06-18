class Skill < ApplicationRecord
  has_many :experience_skills, dependent: :destroy
  has_many :experiences, through: :experience_skills

  has_many :project_skills, dependent: :destroy
  has_many :projects, through: :project_skills
end
