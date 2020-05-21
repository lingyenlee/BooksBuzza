class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:facebook]

     # configure facebook users
     def self.create_from_provider_data(provider_data)
      where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
        user.email = provider_data.info.email
        user.password = Devise.friendly_token[0, 20]
        user.username = provider_data.info.name   
        user.image = provider_data.info.image
        # user.skip_confirmation!
      end
    end

   # -------associations---------
   has_many :listings, dependent: :destroy
   has_one_attached :picture

   #default book image if not attached
    def user_image_path
      picture.attached? ? picture : "default.png"
    end

end
