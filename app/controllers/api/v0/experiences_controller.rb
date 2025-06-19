class Api::V0::ExperiencesController < ApplicationController
  def index
    render json: Experience.all
  end

  def show
    experience = Experience.find_by(id: params[:id])
    if experience 
      render json: experience
    else
      render json: { error: "Experience not found" }, status: not_found
    end
  end
end