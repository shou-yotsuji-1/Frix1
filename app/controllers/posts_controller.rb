class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    
  end
  
  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      image: params[:image]
      )
    if @post.save
       redirect_to("/toppages/index")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save
    redirect_to("/toppages/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/toppages/index")
  end
  
  
end
