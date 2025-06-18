class Api::V0::ProjectsController < ApplicationController
  def index
    render json: Project.all  
  end
end