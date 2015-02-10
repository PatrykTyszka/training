class ProjectsController < ApplicationController

  def index
    render json: Project.all, each_serializer: ProjectsSerializer
  end

  def show
    @project = Project.find(params[:id])
    gon.push(project: @project)
  end

end