class Experience < ApplicationRecord
  has_many :experience_skills
  has_many :skills, through: :experience_skills
end
