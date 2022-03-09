module ParamValidations

  def restrict_access
    key = ApiKey.find_by(access_token: params[:api_key])
    user = User.find_by(api_key: params[:api_key])
    if key && user
      journey_validations
    else
      render json: { status: "UNAUTHORIZED", message: "", data:{} }, status: :unauthorized
    end
  end

  def journey_validations
    if params[:origin] == ""
      you_didnt_say_the_magic_word("Origin")
    elsif params[:destination] == ""
      you_didnt_say_the_magic_word("Destination")
    else
      create
    end
  end

  def location_validation
    if params[:location] == ""
      you_didnt_say_the_magic_word("Location")
    end
  end

  def validate_location
    if params[:location] == ""
      you_didnt_say_the_magic_word("Location")
    end
  end

  def you_didnt_say_the_magic_word(message)
    render json: { status: "BAD REQUEST", message: "#{message} cannot be blank", data:{} }, status: :bad_request
  end
end
