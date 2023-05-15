class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @games = @customer.games
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:game_id)
    @favorite_list = Game.find(favorites)
  end

  def info
    @customer = Customer.find(params[:id])
    @follower_customers = @customer.follower_customer
    @following_customers = @customer.following_customer
  end

  def index
    @customers = Customer.all
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

  def follows
    customer = Customer.find(params[:id])
    @customers = customer.following_customer.page(params[:page]).per(3).reverse_order
  end

  def followers
    customer = customer.follower_customer.page(params[:page]).per(3).reverse_order
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :introduction, :email)

  end
end
