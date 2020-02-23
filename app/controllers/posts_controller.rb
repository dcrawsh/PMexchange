class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_user
  
  def index
    
    if !params[:user_id].blank?
      @posts = User.find(params[:user_id]).posts
    elsif !params[:post].blank? && !params[:post][:category_id].blank?
      @posts = Post.by_category(params[:post][:category_id])
    elsif !params[:date].blank?
      @posts = Post.by_date(params[:date])
      
    else
      @posts = Post.all
    end
  end
  

  def show
    @post = Post.find(params[:id])
    
  end

  def new
    @post = Post.new
  end

  def edit  
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
      render 'edit'
    else 
      redirect_to posts_path, notice: "You do not have this privledge"
    end
  end

  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
    redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
 
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
  end

  def destroy
    
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
    @post.destroy
    redirect_to posts_path
    else 
      redirect_to posts_path, notice: "You do not have this privledge"
    end
  end

  private 
  def post_params
    params.require(:post).permit(:title, :content, :user_id, :category_id, images: [])
  end

  
end

