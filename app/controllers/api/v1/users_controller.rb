class Api::V1::UsersController < ApplicationController


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
end
