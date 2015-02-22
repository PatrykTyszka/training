class ProjectsController < AdminController

  before_action :find_project, only: [:show, :destroy, :edit, :update]

  def index
    render json: Project.all, each_serializer: ProjectsSerializer
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      render json: @project
    else
      render json: { errors: 'Something went wrong!' }
    end
  end

  def show
    gon.push(project: @project)
  end

  def edit
    gon.push(project: @project)
  end

  def update
    if @project.update(project_params)
      redirect_to dashboard_index_path
    else
      render json: { errors: 'Something went wrong!' }
    end
  end

  def destroy
    @project.destroy
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :level, :status)
  end

end