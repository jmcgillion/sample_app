class Favorites < ApplicationController
  def create
    @folder = Folder.find(params[:id])
    @user.favorites << @folder
  end
end