class Vacante < ActiveRecord::Base
  attr_accessible :area, :descripcion, :perfil, :titulo, :inicia, :termina, :status, :tag_list

  acts_as_taggable

  belongs_to :user
end
