class Vacante < ActiveRecord::Base
  attr_accessible :area, :descripcion, :perfil, :titulo, :inicia, :termina, :status, :tag_list
  validate :titulo
  acts_as_taggable

  belongs_to :user
  has_many :aplicacions
end
