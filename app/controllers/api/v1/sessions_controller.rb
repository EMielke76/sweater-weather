class Api::V1::SessionsController < ApplicationController
  before_action :find_user, only: [:create]

  def create
    if @user.present? && @user.authenticate(params[:password])
      json_response(UserSerializer.new(@user))
    else
      render json: { status: 400, message: "#{@user.errors.full_messages.to_sentence}", data:{} }, status: :bad_request
    end
  end

  private
  def find_user
    @user = User.find_by(email: params[:email])
  end
end
