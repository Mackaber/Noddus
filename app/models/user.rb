class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :vacantes

  has_many :aplicacions

  # from http://ruby.railstutorial.org/chapters/following-users#top
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
           class_name:  "Relationship",
           dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :skills, :through => :vacantes, :source => :tags

  has_many :mensajes

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
        user.imagen = auth.pinfo.image

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

  # from http://ruby.railstutorial.org/chapters/following-users#top

  def following?(other_user)
    self.relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user, type)
    self.relationships.create!(followed_id: other_user.id, tipo: type)
  end

  def unfollow!(other_user)
    self.relationships.find_by_followed_id(other_user.id).destroy
  end


  def unseen_messages
    self.mensajes.where("seen = ?",false)
  end

  #def skills
  #  self.vacantes.all.each { |v| v.tags(:skills) }
  #  end
  #end

end
