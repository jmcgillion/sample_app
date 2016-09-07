class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def show
    @folder = Folder.find(params[:folder_id])
    @posts = @folder.posts

    @post = Post.new(note_params)
  end

  def index
    @posts = Post.all
  end

 def create
    @folder = Folder.find(params[:folder_id])
    @post= @folder.posts.build(params.require(:post).permit(:title, :body, :avatar))
    @post.creator = current_user

    if @post.save
      flash[:notice] = 'Your post has posted.'
      redirect_to :back
    else
      render 'folders/show_posts'
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

