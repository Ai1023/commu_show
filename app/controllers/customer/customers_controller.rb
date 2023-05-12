class Customer::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(params[:id])
    @games = @customer.games
  end

  def edit
    @customer = Customer.find_by(params[:id])
  end

  def update
    @customer = Customer.find_by(params[:id])
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def quit
  end

  def out
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :introduction, :email)

  end
end
