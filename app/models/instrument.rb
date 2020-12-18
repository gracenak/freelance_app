class Instrument < ApplicationRecord
    has_many :gig_instruments
    has_many :instruments, through: :gig_instruments
end



