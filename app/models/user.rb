class User < ApplicationRecord
   
    has_many :requests
    has_many :posted_gigs, through: :requests, source: :gigs # investigate
    
    has_many :gigs

    validates :first_name, :last_name, :email, presence: true
    # validates :instrument, :bio, presence: true, on: :update
    validates :email, uniqueness: true

    scope :contractor, -> { where(contractor: 'true') }

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

    def authorized_contractor
        self.contractor = true && current_user = self
    end

end