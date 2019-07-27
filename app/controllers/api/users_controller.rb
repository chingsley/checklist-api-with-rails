class Api::UsersController < Api::BaseController
  before_action :doorkeeper_authorize!

  def index
    @users = User.all
    respond_with @users
  end

  # the rest of actions
end