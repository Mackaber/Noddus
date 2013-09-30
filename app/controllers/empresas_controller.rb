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
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @empresas }
    end
  end
end
