class TasksController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @tasks = @group.tasks.unassigned.order(:deadline)
    @task  = Task.new
  end

  def create
    @group = Group.find(params[:group_id])
    @task = Task.new(task_params)
    if @task.save
      redirect_to group_tasks_path, notice: 'Task successfully created.'
    else
      render action: 'index', status: :unprocessable_entity
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
  end

  def update
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to group_tasks_path, notice: 'Task successfully updated.'
    else
      render action: 'edit', status: :unprocessable_entity
    end
  end

  def claim
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])

    if @task.claim(current_user) and @task.save
      redirect_to group_tasks_path, notice: 'Thanks for volunteering!'
    else
      render action: 'index', alert: 'There was a problem assigning the task.'
    end
  end

  def mark_complete
    @group = Group.find(params[:group_id])
    @task = Task.find(params[:id])

    if @task.complete!
      redirect_to group_tasks_path, notice: 'Thanks so much for filling a need!'
    else
      render action: 'index', alert: 'There was a problem marking the task complete.'
    end
  end

private

  def task_params
    params.require(:task).permit(
      :title,
      :description,
      :deadline,
      :user_id,
      :category_id
    )
  end
end
