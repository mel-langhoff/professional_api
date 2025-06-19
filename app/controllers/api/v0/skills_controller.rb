class Api::V0::SkillsController < ApplicationController
  def index
    render json: Skill.all
  end

  def show
    skill = Skill.find_by(id: params[:id])
    if skill 
      render json: skill
    else
      render json: { error: "Skill not found" }, status: not_found
    end
  end
end