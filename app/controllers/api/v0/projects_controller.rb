class Api::V0::ProjectsController < ApplicationController
  def index
    render json: Project.all  
  end

  def show
    project = Project.find_by(id: params[:id])
    if project 
      render json: project
    else
      render json: { error: "Project not found" }, status: not_found
    end
  end
end