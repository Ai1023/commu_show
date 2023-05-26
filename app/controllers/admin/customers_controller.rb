class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
    @games = @customer.games
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :first_name_kana, :last_name_kana, :nickname, :introduction, :email, :is_active)
  end

end
