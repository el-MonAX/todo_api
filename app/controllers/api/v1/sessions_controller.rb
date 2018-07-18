# frozen_string_literal: true

# SessionsController
class SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: sign_in_params[:email])
    if user&.valid_password?(sign_in_params[:password])
      @current_user = user
      render json: { user_id: user.id }, status: :ok
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end
