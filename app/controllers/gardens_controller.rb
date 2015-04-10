class GardensController < ApplicationController

  def index
    if session[:user_id] = current_user.id
      @gardens = current_user.gardens
    end
  end

  def new
    @garden = Garden.new
  end


  def create
  @garden = current_user.gardens.new(garden_params)
  if @garden.save
     redirect_to user_gardens_path(current_user, @garden)
  else
    render :new
  end
end

  def show
    @garden = Garden.find(params[:id])
    @note = Note.new
  end

  private
  def garden_params

    params.require(:garden).permit(:season_name)
  end

end
