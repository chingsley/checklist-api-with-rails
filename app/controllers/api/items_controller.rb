class Api::ItemsController < Api::BaseController
  before_action :doorkeeper_authorize!

  def index
    @items = Item.all
    respond_with @items
  end

  # the rest of actions
end