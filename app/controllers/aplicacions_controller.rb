class AplicacionsController < ApplicationController

  def aplicar
    @user = current_user
    @vacante = Vacante.find(params[:vacante_id])

    @aplicacion = Aplicacion.new
    @aplicacion.vacante = @vacante
    @aplicacion.user = @user
    @aplicacion.aceptado = false

    authorize! :create, @aplicacion


    @mensaje = Mensaje.new
    @mensaje.user = @vacante.user
    @mensaje.content = "El practicante  #{@user.nombre} a aplicado a tu vacante #{@vacante.titulo}"
    @mensaje.seen = false
    @mensaje.save

    if @aplicacion.save
      respond_to do |format|
        format.html { redirect_to @vacante, notice: 'Aplicando a Vacante' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @vacante, notice: 'Ya has aplicado a esta vacante' }
      end
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

    @mensaje = Mensaje.new
    @mensaje.user = @vacante.user
    @mensaje.content = "La empresa #{@vacante.user.nombre} ha aceptado tu aplicacion a la vacante #{@vacante.titulo}"
    @mensaje.seen = false
    @mensaje.save

    if @aplicacion.save
      respond_to do |format|
        format.html { redirect_to @vacante, notice: 'Practicante Aceptado' }
      end
    else
      respond_to do |format|
        format.html { redirect_to @vacante, notice: 'Este practicante ya ha sido aceptado' }
      end
    end
  end

end
