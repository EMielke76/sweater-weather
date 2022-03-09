class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      json_response(UserSerializer.new(user))
    else
      render json: { status: 400, message: "Email or Password is incorrect", data:{} }, status: :bad_request
    end
  end
end
