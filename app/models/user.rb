class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :vacantes
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

  acts_as_taggable # :habilidades

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:nombre,:cumpleanos,:escuela,:carrera,:ingles_prc,:idioma,:idioma_prc,:genero,:ubicacion, :tag_list, :password, :password_confirmation,
                  :telefono,:skype,:google_prof,:imagen,:twitter,:facebook,:avance_car, :link_video, :perfil,:descripcion,:sitio_web,:uid,:rol,:status

  # attr_accessible :title, :body
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid

      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)

      user.email = auth.info.email
      user.nombre = auth.info.first_name
      #se agrego el split para forzar el tamaño
      user.imagen = auth.info.image.split("?")[0] + "?width=300&height=300"
      user.rol = "Practicante"
      #---------------------------------------
      user.ubicacion = auth.extra.raw_info.try(:location).name
      user.cumpleanos = auth.extra.raw_info.birthday
      user.genero = auth.extra.raw_info.gender
      user.escuela = auth.extra.raw_info.educacion

      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      #Tomado de http://asciicasts.com/episodes/236-omniauth-part-2
      user.save(:validate => false)
    end
  end
end
