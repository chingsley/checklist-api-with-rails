class Api::ItemsController < Api::BaseController
  before_action :doorkeeper_authorize!

  def index
    if params[:query].nil?
      @items = Item.all
    else
      @items = Item.search params[:query]
    end
    
    respond_with @items


    # response = Item.__elasticsearch__.search(
    #   query: {
    #       multi_match: {
    #         query: params[:query],
    #         fields: ['name', 'percent', 'user.email']
    #       }
    #     }
    # ).results

    # render json: {
    #   results: response.results,
    #   total: response.total
    # }
  end

  # the rest of actions
end