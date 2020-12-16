class Gig < ApplicationRecord
    has_many :gig_instruments
    has_many :users, through: :gig_instruments
end
