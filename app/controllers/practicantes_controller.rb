class PracticantesController < ApplicationController

  #def index
  #  respond_to do |format|
  #    format.html # index.html.erb
  #  end
  #end

  def practicantes

    if params[:tag]
      @users = User.where("rol = 'Practicante'").tagged_with(params[:tag] && current_user.skills)
    else
      @users = User.where("rol = 'Practicante'").tagged_with(current_user.try(:skills))
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    #Una empresa NO se muestra como practicante
    @user = User.find(params[:id])
    if @user.rol == "Empresa"
      respond_to do |format|
        format.html { redirect_to "/empresas/" + @user.id.to_s }
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @user }
      end
    end
  end

  def follow
    @user = current_user
    @practicante = User.find(params[:practicante_id])

    if @user.following?(@practicante)
      @user.unfollow!(@practicante)
      respond_to do |format|
        format.html { redirect_to "/practicantes/" + @practicante.id.to_s, notice: "Ha dejado de seguir a este Practicante" }
      end
    else
      @user.follow!(@practicante,"Empresa->Practicante")
      @mensaje = Mensaje.new
      @mensaje.user = @practicante
      @mensaje.content = "La empresa #{@user.nombre} te ha comenzado a seguir"
      @mensaje.seen = false
      @mensaje.save
      respond_to do |format|
        format.html { redirect_to "/practicantes/" + @practicante.id.to_s, notice: "Siguiendo a Practicante" }
      end
    end
  end

end
