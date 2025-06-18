# require 'openai'

# class Api::V0::ChatbotController < ApplicationController
#   def respond
#     message = params[:message].to_s.downcase

#     response = client.chat(
#       parameters: {
#         model: "gpt-4",
#         messages: [
#           { role: "system", content: "You are a helpful assistant that answers questions about Melissa Langhoff’s professional experience. Keep answers clear, concise, and accurate." },
#           { role: "user", content: message }
#         ],
#         temperature: 0.7
#       }
#     )

#     reply = response.dig("choices", 0, "message", "content") || "I'm not sure how to answer that."
#     render json: { reply: reply }
#   end
# end
