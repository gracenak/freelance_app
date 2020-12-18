class Instrument < ApplicationRecord
    has_many :gig_instruments
    has_many :gigs, through: :gig_instruments
end



