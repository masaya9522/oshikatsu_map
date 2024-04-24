class User::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
     # 受け取った値を,で区切って配列にする
    tag_list = params[:post][:tag].split(',')
    if @post.save
      @post.save_tags(tag_list)
      redirect_to posts_path, notice:'投稿が完了しました'
    else
      render :index
    end
  end

  def index
    @posts = Post.all
    @tag_list = Tag.all
  end

  def show
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
    @post_tags = @post.tags
    @post_comment = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    @tag_list = @post.tags.pluck(:name).join(',')
  end

  def update
    @post = Post.find(params[:id])
    tag_list=params[:post][:name].split(',')
    if @post.update(post_params)
      @post.save_tags(tag_list)
      redirect_to post_path
    else
      render :edit
    end
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts
  end


private
  def post_params
    params.require(:post).permit(:image, :introduction)
  end
end