class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
    @games = @customer.games.page(params[:page])
    @game = Game.new
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:game_id)
    @favorite_list = Game.find(favorites)
    follow_number_of_people
  end

  def info
    @customer = Customer.find(params[:id])
    @games = @customer.games
    follow_number_of_people
  end

  def index
    @customers = Customer.all
    @customer = current_customer
    follow_number_of_people
    @q = Customer.ransack(params[:q])
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render 'edit'
    end
  end

  def check
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
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

  def customer_search
    search_function
  end

  def search
    search_function
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :introduction, :email)
  end

  def follow_number_of_people
    @followings = @customer.followings
    @followers = @customer.followers
  end

  def search_function
    @q = Customer.ransack(params[:q])
    @results = @q.result
  end

end
