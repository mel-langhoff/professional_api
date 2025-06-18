# require 'rails_helper'

# RSpec.describe ResumeParser do
#   before :each do
#     @json = {
#       "experiences" => [
#         { "title" => "Software Engineer", "company" => "Tech Co" }
#       ],
#       "skills" => [
#         { "name" => "Ruby" }
#       ],
#       "projects" => [
#         { "name" => "Portfolio Website", "description" => "Built with Rails" }
#       ]
#     }

#     @parsed_json = ResumeParser.new(@json)
#   end
#   describe "initialize" do
#     it "sets experiences from the parsed JSON" do
#       expect(@parsed_json.experiences).to eq(@parsed_json["experiences"])
#     end

#     it "sets skills from the parsed JSON" do
#       expect(@parsed_json.skills).to eq(@parsed_json["skills"])
#     end

#     it "sets projects from the parsed JSON" do
#       expect(@parsed_json.projects).to eq(@parsed_json["projects"])
#     end
#   end
# end