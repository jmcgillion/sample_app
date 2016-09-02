class FoldersController < ApplicationController

  
  def show
  @folder = Folder.find(params[:id])
  end

  def show_posts
    @folder = Folder.find(params[:id])
    @posts = @folder.posts

    @post = Post.new
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.creator = current_user

    if @folder.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end


end



















