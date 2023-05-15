class Customer::GamesController < ApplicationController
  before_action :authenticate_customer!

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
  end

  def index
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    @game.save
    redirect_to games_path
  end

  def update
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:game_title, :game_body)

  end

end
