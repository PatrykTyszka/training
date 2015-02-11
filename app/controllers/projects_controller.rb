class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :destroy, :edit]

  def new

  end

  def index
    render json: Project.all, each_serializer: ProjectsSerializer
  end

  def show
    gon.push(project: @project)
  end

  def edit

  end

  def update

  end

  def destroy
    @project.destroy
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

end