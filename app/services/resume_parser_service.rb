require 'faraday'
require 'json'

class ResumeParserService
  def initialize(text)
    @text = text
  end

  def conn
    Faraday.new(url: 'https://api.openai.com') do |faraday|
      faraday.request :url_encoded
      faraday.headers['Authorization'] = "Bearer #{Rails.application.credentials.openai[:api_key]}"
      faraday.headers['Content-Type'] = 'application/json'
      # faraday.adapter Faraday.default_adapter
    end
  end

  def call
    system_message = "You're a parser that returns structured JSON for a Rails resume database."

    body = {
      model: "gpt-3.5-turbo",
      messages: [
        { role: "system", content: system_message },
        { role: "user", content: prompt }
      ],
      temperature: 0.5
    }

    response = conn.post('/v1/chat/completions') do |req|
      req.body = body.to_json
    end

    content = JSON.parse(response.body)['choices'].first['message']['content']
    
    # Remove surrounding triple backticks if present
    cleaned = content.gsub(/\A```json\s*|\s*```\s*\z/, "")

    JSON.parse(cleaned)
  end

  private

  def prompt
    <<~PROMPT
      Parse the following resume text into JSON to populate these tables:
        - experiences: as an array of hashes with all expected fields
        - skills: as a flat array of strings (skill names)
        - experience_skills: that link skills to experience titles
        - projects: with detailed info
        - project_skills: similarly linking skills to projects

      Resume text:
      #{@text}
    PROMPT
  end
end
