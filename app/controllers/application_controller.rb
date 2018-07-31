# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request
  before_action :current_ability, except: [:login, :register]
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::RoutingError, :with => :record_not_found

  attr_reader :current_user
  attr_reader :current_ability

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def current_ability
    @current_ability ||= Ability.new(AuthorizeApiRequest.call(request.headers).result)
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end
end
