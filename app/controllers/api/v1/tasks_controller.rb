# frozen_string_literal: true

# TasksController
class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]
  before_action :set_project, only: %i[index create]

  def index
    @tasks = @project.tasks
  end

  def show; end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to api_v1_root_path
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      redirect_to api_v1_root_path
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.permit(:name, :completed, :project_id)
  end
end
