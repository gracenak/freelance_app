class User < ApplicationRecord
    has_many :instruments
    has_many :gigs, through: :instruments
    has_secure_password

    def full_name
        self.first_name + " " + self.last_name
    end
end
