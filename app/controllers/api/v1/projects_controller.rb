# frozen_string_literal: true

# ProjectsController
class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: %i[show update destroy]

  def index
    @projects = current_user.projects
  end

  def show; end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      rendirect_to api_v1_root_path
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      rendirect_to api_v1_root_path
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.permit(:name, :user_id)
  end
end
