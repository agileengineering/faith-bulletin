class TasksController < ApplicationController

  def index
    @tasks = Task.order('id desc')
    @task  = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: 'Task successfully created.'
    else
      render action: 'index', status: :unprocessable_entity
    end
  end

private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :deadline,
      :user_id
    )
  end
end
