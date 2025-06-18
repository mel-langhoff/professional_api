# spec/services/resume_parser_service_spec.rb
require 'rails_helper'

RSpec.describe ResumeParserService, :vcr do
  describe "#call" do
    it "returns structured resume data from resume.txt" do
      resume_path = Rails.root.join('lib', 'assets', 'texts', 'resume.txt')
      resume_text = File.read(resume_path)

      service = ResumeParserService.new(resume_text)
      result = service.call

      expect(result).to be_a(Hash)
      expect(result["experiences"]).to be_an(Array)
      expect(result["skills"]).to be_an(Array)
    end
  end

  describe "#conn" do
    it "returns a Faraday connection object" do
      service = ResumeParserService.new("Sup")
      connection = service.conn

      expect(connection).to be_a(Faraday::Connection)
      expect(connection.headers["Authorization"]).to include("Bearer")
      expect(connection.headers["Content-Type"]).to eq("application/json")
    end
  end
end
