class CommentsController < ApplicationController

def new
  @post = Post.find(params[:id])
  @comment = Comment.new
end

def create
  @post = Post.find(params[:id])
  @comment = Comment.new(comment_params)
end

private

def comment_params
  params.require(:comment).permit(:body)
end

end

