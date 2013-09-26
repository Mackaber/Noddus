class AplicacionsController < ApplicationController

  def aplicar
    @user = current_user
    @vacante = Vacante.find(params[:vacante_id])

    @aplicacion = Aplicacion.new
    @aplicacion.vacante = @vacante
    @aplicacion.user = @user
    @aplicacion.aceptado = false

    authorize! :create, @aplicacion

    if @aplicacion.save
      respond_to do |format|
        format.html { redirect_to @vacante, notice: 'Aplicando a Vacante' }
      end
      #Notificacion -> Empresa
    end
  end

  def aceptar
    @aplicacion = Aplicacion.find(params[:aplicacion_id])
    @vacante = @aplicacion.vacante
    @aplicacion.aceptado = true
    @aplicacion.save

    @practicante = @aplicacion.user
    @practicante.status = "ocupado"
    @practicante.save

    if @aplicacion.save
      respond_to do |format|
        format.html { redirect_to @vacante, notice: 'Practicante Aceptado' }
      end
      #Notificacion -> Practicante
    end
  end

end
