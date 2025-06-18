require 'rails_helper'

RSpec.describe ChatbotService, type: :service do
  describe "#conn" do
    it "can make a connection to OpenAI API" do    
      service = ChatbotService.new
      connection = service.conn

      expect(connection).to be_an_instance_of Faraday::Connection
      expect(connection.headers["Authorization"]).to eq("Bearer #{Rails.application.credentials.openai[:api_key]}")
    end
  end

  describe "#chat", :vcr do
    it "returns response from OpenAI API" do
      service = ChatbotService.new  
      response = service.chat("Sup")

      expect(response).to be_a String
      expect(response).not_to be_empty
    end
  end
end
