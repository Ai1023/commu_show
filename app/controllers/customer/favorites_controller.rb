class Customer::FavoritesController < ApplicationController
  before_action :authenticate_customer!
  
  def create
    game = Game.find(params[:game_id])
    favorite = current_customer.favorites.new(game_id: game.id)
    favorite.save
    redirect_to game_path(game)
  end

  def destroy
    game = Game.find(params[:game_id])
    favorite = current_customer.favorites.find_by(game_id: game.id)
    favorite.destroy
    redirect_to game_path(game)
  end
end
