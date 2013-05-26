class VacantesController < ApplicationController
  # GET /vacantes
  # GET /vacantes.json
  def index
    @vacantes = Vacante.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vacantes }
    end
  end

  # GET /vacantes/1
  # GET /vacantes/1.json
  def show
    @vacante = Vacante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vacante }
    end
  end

  # GET /vacantes/new
  # GET /vacantes/new.json
  def new
    @vacante = Vacante.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vacante }
    end
  end

  # GET /vacantes/1/edit
  def edit
    @vacante = Vacante.find(params[:id])
  end

  # POST /vacantes
  # POST /vacantes.json
  def create
    @vacante = Vacante.new(params[:vacante])

    respond_to do |format|
      if @vacante.save
        format.html { redirect_to @vacante, notice: 'Vacante was successfully created.' }
        format.json { render json: @vacante, status: :created, location: @vacante }
      else
        format.html { render action: "new" }
        format.json { render json: @vacante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vacantes/1
  # PUT /vacantes/1.json
  def update
    @vacante = Vacante.find(params[:id])

    respond_to do |format|
      if @vacante.update_attributes(params[:vacante])
        format.html { redirect_to @vacante, notice: 'Vacante was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vacante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacantes/1
  # DELETE /vacantes/1.json
  def destroy
    @vacante = Vacante.find(params[:id])
    @vacante.destroy

    respond_to do |format|
      format.html { redirect_to vacantes_url }
      format.json { head :no_content }
    end
  end
end
