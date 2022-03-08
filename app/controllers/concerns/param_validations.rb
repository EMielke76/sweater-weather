module ParamValidations

  def restrict_access
    key = ApiKey.find_by(access_token: params[:api_key])
    user = User.find_by(api_key: params[:api_key])
    if key && user
      location_validations
    else
      render json: { status: "UNAUTHORIZED", message: "", data:{} }, status: :unauthorized
    end
  end

  def location_validations
    if params[:origin] == ""
      render json: { status: "BAD REQUEST", message: "Origin cannot be blank", data:{} }, status: :bad_request
    elsif params[:destination] == ""
      render json: { status: "BAD REQUEST", message: "Destination cannot be blank", data:{} }, status: :bad_request
    else
      create
    end
  end
end
