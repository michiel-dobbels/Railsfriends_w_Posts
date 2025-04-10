class PostsController < ApplicationController
    before_action :authenticate_user!
    #before_action :set_post, only: [:show, :edit, :update, :destroy]
  
    def index
      @posts = Post.all.order(created_at: :desc)
    end
  
    def show
      @post = Post.find(params[:id])  
      @comment = Comment.new
    end
  
    def new
      @post = current_user.posts.build
    end
  
    def create
      @post = current_user.posts.build(post_params)
      if @post.save
        redirect_to posts_path, notice: "Post created!"
      else
        render :new
      end
    end
  
    private
  
    def set_post
      @post = Post.find(params[:id])
      @comment = Comment.new
    end
  
    def post_params
      params.require(:post).permit(:content)
    end
  end
      
