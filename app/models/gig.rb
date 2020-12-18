class Gig < ApplicationRecord
    belongs_to :instrument
    belongs_to :user

    has_many :listings
    has_many :users, through: :listings

    def instruments_attributes=(instrument_attributes)
        self.instrument = Instrument.find_or_create_by(instrument_attributes) if !instrument_attributes[:name].empty?
        self.instrument
    end
end
