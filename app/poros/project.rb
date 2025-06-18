class Project
  attr_reader :name, :description, :technologies, :github_url, :demo_url

  def initialize(json)
    @name = json["name"]
    @description = json["description"]
    @technologies = json["technologies"]
    @github_url = json["github_url"]
    @demo_url = json["demo_url"]
  end
end