class Api::V0::SkillsController < ApplicationController
  def index
    render json: Skill.all
  end
end