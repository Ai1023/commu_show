class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @games = @customer.games
    @game = Game.new
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:game_id)
    @favorite_list = Game.find(favorites)
    @followings = @customer.followings
    @followers = @customer.followers
  end

  def info
    @customer = Customer.find(params[:id])
    @games = @customer.games
    @followings = @customer.followings
    @followers = @customer.followers
  end

  def index
    @customers = Customer.all
    @customer = current_customer
    @followings = @customer.followings
    @followers = @customer.followers
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def quit
  end

  def out
  end

    # フォローフォロワー一覧処理
  def followings
    customer = Customer.find(params[:id])
    @customers = customer.followings
    @customer = Customer.find(params[:id])
  end

  def followers
    customer = Customer.find(params[:id])
    @customers = customer.followers
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :introduction, :email)

  end
end
