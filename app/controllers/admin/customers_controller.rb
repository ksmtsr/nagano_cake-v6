class Admin::CustomersController < ApplicationController

def new
  @customers = Customer.new
end

def create
  customer = Customer.new(item_params)
  customer.save!
  redirect_to customers_information_edit_path(cu)
end

def index
  @customers = Customer.order("created_at DESC").page(params[:page]).per(10)
end

def show
  @customer = Customer.find(params[:id])
end

def edit
  @customer = Customer.find(params[:id])
end

def update
  customer = Customer.find(params[:id])
  customer.update(customer_params)
  redirect_to admin_customer_path(customer.id)
end




private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :postal_code,:address, :telephon_number, :is_deleted )
  end

end
