class Gig < ApplicationRecord
    
    belongs_to :user
    has_many :gig_instruments
    has_many :instruments, through: :gig_instruments

    has_many :listings
    has_many :users, through: :listings

    def instruments_attributes=(instrument_attributes)
        self.instrument = Instrument.find_or_create_by(instrument_attributes) if !instrument_attributes[:name].empty?
    end
end
