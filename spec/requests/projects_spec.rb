require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:token) { AuthenticateUser.call(user.username, user.password).result }
  let(:projects) { FactoryBot.create_list(:project, 3, user_id: user.id) }
  let(:project) { FactoryBot.create(:project, user_id: user.id) }
  let(:project_params) { FactoryBot.attributes_for(:project) }

  let(:headers) { {authorization: token, accept: 'application/json'} }

  describe "GET /projects" do
    it "gets list of projects" do
      projects
      get api_v1_projects_path, headers: headers
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('projects')
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe "POST /projects" do
    it "creates new project" do
      post api_v1_projects_path, headers: headers, params: project_params
      expect(response).to have_http_status(201)
      expect(response).to match_response_schema('project')
    end
  end

  describe "POST /projects" do
    it "do not creates duplicate project" do
      2.times { post api_v1_projects_path, headers: headers, params: project_params }
      expect(response).to have_http_status(409)
      expect(response).to match_response_schema('project')
      expect(response.body).to include('The project with such name does already exist')
    end
  end

  describe "PUT /projects/:id" do
    it "update project" do
      edited_project = FactoryBot.attributes_for(:project, :edited)
      put "/api/v1/projects/#{project.id}", headers: headers, params: edited_project
      expect(response).to have_http_status(200)
      expect(response).to match_response_schema('project')
      expect(response.body).to include('edited name')
    end
  end

  describe "DELETE /projects/:id" do
    it "delete project" do
      delete "/api/v1/projects/#{project.id}", headers: headers
      expect(response).to have_http_status(204)
    end
  end
end
