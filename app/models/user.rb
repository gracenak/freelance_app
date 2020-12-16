class User < ApplicationRecord
    has_many :gig_instruments
    has_many :gigs, through: :gig_instruments
    has_secure_password
end
