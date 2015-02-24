class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def upload
    Play.upload(params[:file])
    flash[:notice]= "Play Uploaded"
    redirect_to root_url
  end

  def show
    @play = Play.find(params[:id])
    @roles = @play.roles
  end
  
end
