class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def upload
    if params[:file].nil?
      flash[:notice] = "Please attach file"
    else
      Play.upload(params[:file])
      flash[:notice]= "Play Uploaded"
    end
    redirect_to root_url
  end

  def show
    @play = Play.find(params[:id])
    @roles = @play.roles
  end

end
