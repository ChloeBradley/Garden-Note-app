class GardensController < ApplicationController
before_action :current_user

  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end
end
