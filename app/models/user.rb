class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :vacantes
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  acts_as_taggable # :habilidades

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:nombre,:cumpleanos,:escuela,:carrera,:ingles_prc,:idioma,:idioma_prc,:genero,:ubicacion, :tag_list, :password, :password_confirmation,
                  :telefono,:skype,:google_prof,:imagen,:twitter,:facebook,:avance_car, :link_video, :perfil,:descripcion,:sitio_web,:uid,:rol,:status,:avatar

  mount_uploader :avatar, AvatarUploader

  # attr_accessible :title, :body
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|

      user.provider = auth.provider
      user.uid = auth.uid
      user.rol = "Practicante"
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at) unless auth.credentials.expires_at.nil?

      if user.provider == 'facebook'
        user.email = auth.info.email
        user.nombre = auth.info.first_name
        #se agrego el split para forzar el tamaño
        user.imagen = auth.info.image.split("?")[0] + "?width=300&height=300"
        #---------------------------------------
        user.ubicacion = auth.extra.raw_info.try(:location).try(:name)
        user.cumpleanos = auth.extra.raw_info.date
        user.genero = auth.extra.raw_info.gender
        user.escuela = auth.extra.raw_info.educacion

      elsif user.provider == 'linkedin_oauth2'
        #Birthdate
        day = auth.extra.raw_info.dateOfBirth.day
        month = auth.extra.raw_info.dateOfBirth.month
        year = auth.extra.raw_info.dateOfBirth.year
        birthdate = day.to_s + "/" + month.to_s + "/" + year.to_s

        user.email =  auth.info.email
        user.nombre = auth.info.name
        user.ubicacion = auth.info.location.name
        user.imagen = auth.extra.raw_info.pictureUrls.values[1][0]
        user.escuela = auth.extra.raw_info.educations.values[1][0].schoolName
        user.cumpleanos = birthdate.to_date
      elsif user.provider == 'google_oauth2'
        user.email = auth.info.email
        user.nombre = auth.info.name
        user.imagen = auth.info.image

        bd = auth.extra.raw_info.try(:birthday).try(:to_date)
        if bd.year > 0
          user.cumpleanos = auth.extra.raw_info.try(:birthday).try(:to_date)
        end
        user.genero = auth.extra.raw_info.gender

      end
      #Tomado de http://asciicasts.com/episodes/236-omniauth-part-2
      user.save(:validate => false)
    end
  end
end
