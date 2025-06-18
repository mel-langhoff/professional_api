class SkillEntry
  attr_reader :name

  def initialize(json)
    @name = json["skill"]["name"]
  end
end