class BurgersController < ApplicationController
  def index
    render json: Burger.all.order('id')
  end

  def create
    ingredient_ids_array = burger_params['ingredients']

    new_burger = Burger.create(name: burger_params['name'], owner_name: burger_params['owner_name'])

    new_burger.addIngredients(ingredient_ids_array)

    burger_to_return = {
      id: new_burger.id,
      name: burger_params['name'],
      owner_name: burger_params['owner_name'],
      ingredients: ingredient_ids_array
    }

    # Burger.find(new_burger.id)
    render json: burger_to_return
  end

  def update
    ingredient_ids_array = params['ingredients']

    burger_to_update = Burger.find(params[:id])
    burger_to_update.update(name: burger_params['name'], owner_name: burger_params['owner_name'])
    burger_to_update.updateIngredients(ingredient_ids_array)

    # burger_to_return = {
    #   name: burger_params['name'],
    #   owner_name: burger_params['owner_name'],
    #   ingredients: ingredient_ids_array
    # }

# burger_to_return

    render json: Burger.find(params[:id])
  end

  def destroy
    render json: Burger.find(params[:id]).destroy
  end


  private

  def burger_params
    params.require(:burger).permit(:name, :owner_name, ingredients: [])
  end

end
