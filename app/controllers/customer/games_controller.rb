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
      redirect_to customers_my_page_path, notice: "投稿しました"
    else
      @customer = current_customer
      @games = @customer.games.page(params[:page])
      favorites = Favorite.where(customer_id: current_customer.id).pluck(:game_id)
      @favorite_list = Game.find(favorites)
      @followings = @customer.followings
      @followers = @customer.followers
      flash[:notice] = "内容を記入してください"
      render 'customer/customers/show'
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
