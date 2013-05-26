class EmpresasController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def empresas
    if params[:tag]
      @empresas = User.where("rol = 'Empresa'").tagged_with(params[:tag])
    else
      @empresas = User.where("rol = 'Empresa'")
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
