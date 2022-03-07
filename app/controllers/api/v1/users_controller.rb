class Api::V1::UsersController < ApplicationController
  # before_filter :restrict_access, only: [:show]

  def create
    user = User.create(user_params)

    if user.save
      user.generate_api_key
      json_response(UserSerializer.new(user), :created)
    else
      render json: { status: 400, message: "#{user.errors.full_messages.to_sentence}", data:{} }, status: :bad_request
    end
  end

  private
  #in headers, 'Authorization: Token token=apikey'
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_toke: token)
    end
  end
end
