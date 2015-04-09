class NotesController < ApplicationController

  before_action do
    @garden = Garden.find(params[:garden_id])
  end

  def create
    @note = @garden.notes.new(note_params)
    @note.save
    redirect_to user_garden_path(@garden, @garden[:id])
  end
end



private

  def note_params
    params.require(:note).permit(:title, :note, :date, :garden_id)
  end

   def find_user
     @user = User.find(current_user)
   end
