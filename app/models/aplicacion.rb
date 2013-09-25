class Aplicacion < ActiveRecord::Base
  belongs_to :user
  belongs_to :vacante
  attr_accessible :aceptado
end
