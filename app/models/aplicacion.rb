class Aplicacion < ActiveRecord::Base
  belongs_to :user
  belongs_to :vacante
  attr_accessible :aceptado

  validates_uniqueness_of :user_id, :scope => :vacante_id
end
