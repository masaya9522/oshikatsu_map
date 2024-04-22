class User::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :set_current_customer
  
  def show
    @customers = Customers.find(current_customer.id)
  end
  
  def edit
    @customers = Customers.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customers.permit(:name, :introduction)
  end

end
