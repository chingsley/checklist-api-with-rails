class ApplicationController < ActionController::Base
  def current_api_user
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
