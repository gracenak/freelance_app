class Gig < ApplicationRecord
    has_many :instruments
    has_many :users, through: :instruments

    def instruments_attributes=(instrument_attributes)
        instrument_attributes.values.each do |instrument_attribute|
            if instrument_attribute[:name].present?
                instrument = Instrument.find_or_create_by(instrument_attribute)
                self.instruments << instrument
                if !self.instruments.include?(instrument)
                    self.instruments.build(:instrument => instrument)
                end
            end
        end
    end
end
