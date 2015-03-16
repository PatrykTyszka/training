class ProjectsSerializer < ActiveModel::Serializer

  attributes :current_page, :total_pages, :limit_value

  has_many :projects, serializer: ProjectSerializer

  def projects
    object
  end

  delegate :current_page, :total_pages, :limit_value, to: :object

end
