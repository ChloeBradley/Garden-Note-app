class GardensController < ApplicationController
before_action :current_user

  def index
    @gardens = current_user.gardens
  end

  def show
    @garden = Garden.find(params[:id])
  end
end
