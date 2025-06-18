class PersonalDetailSerializer
  include JSONAPI::Serializer

  attributes  :about_me,
              :email,
              :location,
              :phone_number
end