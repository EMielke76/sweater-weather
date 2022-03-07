class Api::V1::UsersController < ApplicationController
before_filter :restrict_access

private
#in headers, 'Authorization: Token token=apikey'
def restrict_access
  authenticate_or_request_with_http_token do |token, options|
    ApiKey.exists?(access_toke: token)
  end
end
