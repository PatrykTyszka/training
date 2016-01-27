class TodoSerializer < ActiveModel::Serializer
  has_many :tasks, serializer: TaskSerializer
  attributes :id, :name
end # class TodoSerializer
