class Vacante < ActiveRecord::Base
  attr_accessible :area, :descripcion, :perfil, :titulo, :vistas, :inicia, :termina, :status
end
