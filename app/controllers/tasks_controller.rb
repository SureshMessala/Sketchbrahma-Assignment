class TasksController < ApplicationController

  def show
    @task = Task.find_by_id(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(project_params)
    task.user_id = current_user.id
    task.project_id = 
    if project.save
      redirect_to root_path()
      flash[:notice] = "Project was created"
    else
      redirect_to new_project_path()
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :title)
  end
end
