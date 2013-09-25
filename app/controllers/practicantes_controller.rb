class PracticantesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def practicantes

    if params[:tag]
      @users = User.where("rol = 'Practicante'").tagged_with(params[:tag])
    else
      @users = User.where("rol = 'Practicante'")
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    #Una empresa NO se muestra como practicante
    @user = User.find(params[:id])
    if @user.rol = "Empresa"
      respond_to do |format|
        format.html { redirect_to root_url }
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end
end
