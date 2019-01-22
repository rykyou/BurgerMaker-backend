class BurgersController < ApplicationController
  def index
    render json: Burger.all
  end

end
