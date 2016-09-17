class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
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

  def vote
    @vote = Vote.create(vote: params[:vote], creator: current_user)

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = 'Your vote was counted.'
        else
          flash[:error] = 'You can only vote on a post once.'
        end
        redirect_to :back
      end
      format.js
    end
  end
    

  def update

  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  
end

