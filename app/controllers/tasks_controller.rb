class TasksController < ApplicationController

  def show
    @task = Task.find_by_id(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    task.user_id = current_user.id
    task.project_id = Project.find_by(user_id: current_user.id)
    if project.save
      redirect_to root_path()
      flash[:notice] = "Project was created"
    else
      redirect_to new_project_path()
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @tasks = Task.update(task_params)
    @tasks.user_id = current_user.id
    if @tasks.save
      flash[:notice] = 'Task added!'
      redirect_to project_path(@tasks.id)
    else
      redirect_to new_project_path()
    end
  end

  def destroy
    task = Task.find_by_id(params[:id])
    project_id = task.project_id
    if task.destroy
      redirect_to project_path[project_id]
      flash[:Success] = "Task is deleted"
    else
      flash[:notice] = "Task is NOT deleted"
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :title)
  end
end
