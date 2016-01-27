class TodosController < ApplicationController
  layout 'todo'

  def show
    @todo = Todo.find(params[:id])
    gon.push(TodoSerializer.new(@todo).as_json)
  end
end
