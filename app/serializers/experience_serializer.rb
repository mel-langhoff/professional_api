class ExperienceSerializer
  include JSONAPI::Serializer

  attributes  :title,
              :company,
              :location,
              :start_date,
              :end_date,
              :description

  has_many :skills
end