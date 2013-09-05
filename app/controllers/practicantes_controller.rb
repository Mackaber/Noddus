class PracticantesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def practicantes
    @users = User.where('pro' => true).where("rol = 'Practicante'")
    if params[:tag]
      @users = @users.tagged_with(params[:tag])
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
