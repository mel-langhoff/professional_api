class ProjectSerializer
  include JSONAPI::Serializer

  attributes  :name,
              :description,
              :technologies,
              :github_url,
              :demo_url

  has_many :skills
end