class NotesController < ApplicationController
  def index
    @notes = current_user.notes
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def create
    binding.pry
    @note = Note.new(note_params)
    @note.creator = current_user

    if @note.save
      redirect_to root_path
    else
      flash[:error] = "This was the boom-pop ..."
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    if @note.save
      redirect_to root_path
    else 
      render :edit
    end
  end

def destroy
end

def search
  @results = Note.search_by_title(params[:search_term])
end

  private

  def note_params
    params.require(:note).permit(:subject, :body)
  end
end













