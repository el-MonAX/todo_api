# frozen_string_literal: true

# TasksController
class Api::V1::TasksController < ApplicationController
  load_and_authorize_resource :project, through: :current_user
  load_and_authorize_resource through: :project, shallow: true

  def index
    render json: @tasks
  end

  def show
    render json: @task
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def update
    command = UpdateTask.call(@task, task_params)

    if command.result
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
  end

  private

  def task_params
    params.permit(:name, :completed, :deadline, :project_id, :move)
  end
end
