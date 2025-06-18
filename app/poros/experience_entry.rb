class ExperienceEntry
  attr_reader :title, :company, :location, :description, :demo_url

  def initialize(json)
    @title = json["title"]
    @company = json["company"]
    @location = json["location"]
    @description = json["description"]
    @start_date = json["start_date"]
    @end_date = json["end_date"]
  end
end