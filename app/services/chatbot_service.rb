class ChatbotService

  def initialize
    @api_key = Rails.application.credentials.openai[:api_key]
  end
  
  # sets http cxn using faraday
  def conn
    Faraday.new(url: "https://api.openai.com/v1/chat/completions") do |faraday|
      faraday.headers["Content-Type"] = "application/json"
      faraday.headers["Authorization"] = "Bearer #{@api_key}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def chat(message)
    body = {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: message }],
      max_tokens: 150
    }.to_json

    response = conn.post do |req|
      req.body = body
    end

    if response.success?
      data = JSON.parse(response.body)
      data.dig("choices", 0, "message", "content") || "Sorry, no response can be found."
    else
      Rails.logger.error("OpenAI API Error: #{response.status} #{response.body}")
      "Sorry, something went wrong with the API."
    end
  end
end