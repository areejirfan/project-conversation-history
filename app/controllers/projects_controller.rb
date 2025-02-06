class ProjectsController < ApplicationController
    before_action :authenticate_user!

    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end
  
    def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to root_path, notice: "Project created successfully"
      else
        flash[:alert] = "Error while creating project"
        redirect_to new_project_path
      end
    end
  
    def edit
      @project = Project.find(params[:id])
    end

    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to root_path, notice: "Project updated successfully"
      else
        flash[:alert] = "Error while updating project"
        redirect_to edit_project_path(@project) 
      end
    end
    

    def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to root_url
    end
    private
  
    def project_params
      params.require(:project).permit(:title, :description, :status)
    end
  end
  