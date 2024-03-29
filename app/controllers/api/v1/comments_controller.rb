class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource :project, through: :current_user
  load_and_authorize_resource :task, through: :project
  load_and_authorize_resource through: :task, shallow: true

  resource_description do
    short 'Comments'
    formats ['json']
  end

  def_param_group :comment do
    param :text, String, "Text of the comment", required: true
    param :file, String, "File attachment to the comment"
  end

  api :GET, "/projects/:project_id/tasks/:task_id/comments", "Get list of comments"
  param :project_id, String, "ID of the task`s project", required: true
  param :task_id, String, "ID of the comment`s task", required: true

  def index
    render json: @comments
  end

  api :GET, "/comments/:id", "Show specific comment"
  param :id, String, "ID of the comment", required: true

  def show
    render json: @comment
  end

  api :POST, "/projects/:project_id/tasks/:task_id/comments", "Create a comment"
  param :project_id, String, "ID of the task`s project", required: true
  param :task_id, String, "ID of the comment`s task", required: true
  param_group :comment

  def create
    @comment = @task.comments.build(comment_params)

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  api :PUT, "/comments/:id", "Update a comment"
  param :id, String, "ID of the comment", required: true
  param_group :comment

  def update
    if @comment.update(comment_params)
      render json: @task, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/comments/:id", "Delete a comment"
  param :id, String, "ID of the comment", required: true

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.permit(:text, :file, :file_cache, :remote_file_url, :task_id)
  end
end
