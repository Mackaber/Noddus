class EmpresasController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def empresas
    @empresas = User.where('pro' => true).where("rol = 'Empresa'")

    if params[:tag]
      @empresas = @empresas.tagged_with(params[:tag])
    end

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    #Los estudiantes NO se muestran como empresas
    @user = User.find(params[:id])
    if @user.rol == "Practicante"
      respond_to do |format|
        format.html { redirect_to "/practicantes/" + @user.id.to_s }
      end
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @empresas }
      end
    end
  end

  def follow
    @user = current_user
    @empresa = User.find(params[:empresa_id])

    if @user.following?(@empresa)
      @user.unfollow!(@empresa)
      respond_to do |format|
        format.html { redirect_to "/empresas/" + @empresa.id.to_s, notice: "Ha dejado de seguir a esta Empresa" }
      end
    else
      @user.follow!(@empresa,"Practicante->Empresa")

      @mensaje = Mensaje.new
      @mensaje.user = @empresa
      @mensaje.content = "El practicante  #{@user.nombre} te ha comenzado a seguir"
      @mensaje.seen = false
      @mensaje.save

      respond_to do |format|
        format.html { redirect_to "/empresas/" + @empresa.id.to_s, notice: "Siguiendo a Empresa" }
      end
    end
  end

end
