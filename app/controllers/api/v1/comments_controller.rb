# frozen_string_literal: true

# CommentsController
class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :set_task, only: %i[create]

  def index
    @comments = @task.comments
  end

  def show; end

  def create
    @comment = @task.comment.build(comment_params)

    if @comment.save
      rendirect_to api_v1_root_path
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      rendirect_to api_v1_root_path
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_task
    @task = task.find(params[:task_id])
  end

  def comment_params
    params.permit(:text, :file, :task_id)
  end
end
