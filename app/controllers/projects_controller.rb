class ProjectsController < ApplicationController

  def show
    @project = Project.find_by_id(params[:id])
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.create(project_params)
    project.user_id = current_user.id
    if project.save
      redirect_to root_path()
      flash[:notice] = "Project was created"
    else
      redirect_to new_project_path()
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.update(project_params)
    @project.user_id = current_user.id
    if @project.save
      flash[:notice] = 'Product added!'
      redirect_to project_path(@project.id)
    else
      redirect_to new_project_path()
    end
  end

  def destroy
    project = Project.find_by_id(params[:id])
    if project.destroy
      redirect_to root_path
      flash[:Success] = "Project is deleted"
    else
      flash[:notice] = "Project is NOT deleted"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :user_id)
  end
end
