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
    @game = Game.find(params[:id])
  end

  def index_all
    @q = Game.ransack(params[:q])
    @games = params[:tag_id].present? ? Tag.find(params[:tag_id]).games : Game.all
  end

  def create
    @game = Game.new(game_params)
    @game.customer_id = current_customer.id
    if @game.save
      flash[:notice] = "投稿しました"
      redirect_to customers_my_page_path
    else
      redirect_to customers_my_page_path
    end
  end

  def update
    game = Game.find(params[:id])
    if game.update(game_params)
      redirect_to game_path(game.id)
    else
      @game = Game.find(params[:id])
      render 'edit'
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.customer_id = current_customer.id
    game.destroy
    redirect_to customers_my_page_path
  end

  def search
    @q = Game.ransack(params[:q])
    @results = @q.result
  end

  private

  def game_params
    params.require(:game).permit(:game_title, :game_body, tag_ids: [])
  end

end
