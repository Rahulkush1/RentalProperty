# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  respond_to :json

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #   super do |user|
  #     render json: user
  #   end
  # end

  def create
    user = User.find_by_email(configure_sign_in_params[:email])
    if user && user.valid_password?(configure_sign_in_params[:password])
      sign_in("user", user)
      render :json=> {data: user}
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def configure_sign_in_params
    params.require(:user).permit(:email,:password)
  end
end
