class User::HomesController < ApplicationController
  def top
    @posts = Post.order(created_at: :desc).limit(4)
  end
end
