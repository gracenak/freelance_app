class User < ApplicationRecord
   
    has_many :listings
    has_many :posted_gigs, through: :listings, source: :posted_gigs
    
    has_many :gigs
    validates :first_name, :last_name, :email, presence: true
    has_secure_password #validations for presence of password


    def self.find_or_create_by_omniauth(auth)
        User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            u.first_name = auth['info']['first_name']
            u.last_name = auth['info']['last_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex
        end
    end

    def full_name
        self.first_name + " " + self.last_name
    end
end