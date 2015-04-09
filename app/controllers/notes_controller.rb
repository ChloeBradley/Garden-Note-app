class NotesController < ApplicationController

  before_action do
    @garden = Garden.find(params[:garden_id])
  end

  def create
      @note = @garden.notes.new(note_params)
      @note.user_id = current_user.id
      if @note.save
        redirect_to graden_note_path(@garden[:garden_id], @note[:id])
      else
        redirect_to garden_note_path(@garden[:garden_id], @note[:id])
      end
    end
   end
end


private

def comment_params
  params.require(:comment).permit(:text, :user_id, :task_id)
end

 def find_user
   @user = User.find(current_user)
 end



end
