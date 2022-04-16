class TasksController < ApplicationController

  def show
    @project = Project.find params[:project_id]
    @task = Task.find_by_id(params[:id])
  end

  def new
    @project = Project.find params[:project_id]
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    task.user_id = current_user.id
    task.project_id = Project.find(params[:project_id]).id
    if task.save
      redirect_to project_path(params[:project_id])
      flash[:notice] = "Task was created"
    else
      flash[:notice] = "Task not created"
    end
  end

  def edit
    @project = Project.find params[:project_id]
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash[:notice] = 'Task added!'
      redirect_to project_task_path(task.project_id, task.id)
    else
      redirect_to new_project_path()
    end
  end

  def destroy
    task = Task.find_by_id(params[:id])
    project_id = task.project_id
    if task.destroy
      redirect_to project_path(params[:project_id])
      flash[:Success] = "Task is deleted"
    else
      flash[:notice] = "Task is NOT deleted"
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :content)
  end
end
