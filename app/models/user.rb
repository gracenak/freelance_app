class User < ApplicationRecord
   
    has_many :listings
    has_many :posted_gigs, through: :listings, source: :posted_gigs
    has_many :gigs
    has_secure_password

    def full_name
        self.first_name + " " + self.last_name
    end
end