class TasksController < ApplicationController
  def create
    todo = Todo.find(params[:task][:todo_id])
    task = todo.tasks.new(task_params)
    if task.save
      render json: task
    else
      render json: { errors: 'Something went wrong!'}
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: task
  end

  private

  def task_params
    params.require(:task).permit(:description)
  end
end # class TasksController
