class Admin::GamesController < ApplicationController
  before_action :authenticate_admin!

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    game = Game.find(params[:id])
    customer_id = game.customer_id
    game.destroy
    redirect_to admin_customer_path(customer_id)
  end
end
