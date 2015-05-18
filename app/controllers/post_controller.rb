class PostController < ApplicationController

  layout false

  def index
    @posts = Post.all
    puts @posts.inspect
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new({:user_id => "Default"})
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "post created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "post updated successfully."
      redirect_to(:action => 'show', :id => @post.id)
    else
      render('edit')
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id]).destroy
    flash[:notice] = "post destroyed successfully."
    redirect_to(:action => 'index')
  end


  private

    def post_params
      params.require(:post).permit(:user_id)
    end
end
