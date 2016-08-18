class HomeController < ApplicationController
  def index
    
  end
  def write
    @email = params[:email]
    @title = params[:title]
    @text = params[:text]
    
    new_post = Post.new
    new_post.email = @email
    new_post.title = @title
    new_post.text = @text
    new_post.save
    
    redirect_to "/list"
  end
  def list
    @every_post =    Post.all.order("id desc")
  end
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to "/list"
  end
  def update_view
    @one_post = Post.find(params[:id])
  end
  def update
    @one_post = Post.find(params[:id])
    @one_post.email = params[:email]
    @one_post.title = params[:title]
    @one_post.text = params[:text]
    @one_post.save
    redirect_to "/list"
  end
end