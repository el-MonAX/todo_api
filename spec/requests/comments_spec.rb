require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:project) { FactoryBot.create(:project, user_id: user.id) }
  let!(:task) { FactoryBot.create(:task, project_id: project.id) }
  let!(:comments) { FactoryBot.create_list(:comment, 3, task_id: task.id) }
  let!(:comment) { FactoryBot.create(:comment, task_id: task.id) }
  let!(:comment_params) { FactoryBot.attributes_for(:comment) }

  let!(:token) { AuthenticateUser.call(user.username, user.password).result }
  let!(:headers) { {authorization: token, accept: 'application/json'} }



  describe "GET /comments" do
    it "gets list of comments" do
      comments
      get "/api/v1/projects/#{project.id}/tasks/#{task.id}/comments", headers: headers
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('comments')
      expect(response.parsed_body.size).to eq(4)
    end
  end

  describe "POST /comments" do
    it "creates new comment" do
      post "/api/v1/projects/#{project.id}/tasks/#{task.id}/comments", headers: headers, params: comment_params
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema('comment')
    end
  end

  describe "DELETE /comments/:id" do
    it "delete comments" do
      delete "/api/v1/comments/#{comment.id}", headers: headers
      expect(response).to have_http_status(204)
    end
  end
end
