class PostsController < ApplicationController
  def show
    @folder = Folder.find(params[:folder_id])
    @posts = @folder.posts

    @post = Post.new(note_params)
  end

  def index
    @posts = Post.all
  end

  def new

  end

  def create
    @folder = Folder.find(params[:folder_id])
    @post= @folder.posts.build(params.require(:post).permit(:title, :body))
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post has posted.'
      redirect_to post_path(@post)
    else
      render :show
    end
  end

  def edit

  end

  def update

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  
end

