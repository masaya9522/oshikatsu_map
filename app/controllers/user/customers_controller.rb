class User::CustomersController < ApplicationController
  
  def show
    @customer = current_user
    @posts = @customer.posts
    @post_tag = @posts.name
  end
  
 

  private

  def customer_params
    params.require(:customers).permit(:name, :introduction)
  end

end
