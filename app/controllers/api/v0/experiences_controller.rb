class Api::V0::ExperiencesController < ApplicationController
  def index
    render json: Experience.all
  end
end