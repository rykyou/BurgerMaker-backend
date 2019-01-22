class BurgersController < ApplicationController
  def index
    render json: Burger.all
  end

  def create
    render json: Burger.create(burger_params)
  end

  def update
    Burger.find(params[:id]).update(burger_params)
    render json: Burger.find(params[:id])
  end

  def destroy
    render json: Burger.find(params[:id]).destroy
  end

  private

  def burger_params
    params.require(:burger).permit(:name, :owner_name, :ingredients)
  end

end
