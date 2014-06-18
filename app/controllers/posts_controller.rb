class PostsController < ApplicationController
 
  before_action :set_post, only: [:show, :edit, :update]
  #1. set up instance variable for action
  #2. redirect based on some condition
   
  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user = User.first
    
    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to posts_path
    else #validation error
      render 'new'
    end
  end
  
  def edit

  end
  
  def update    
    if @post.update(post_params)
      flash[:notice] = "Your post was updated."
      redirect_to posts_path
    else
      render 'edit'
    end
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
end