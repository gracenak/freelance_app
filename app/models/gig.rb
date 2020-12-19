class Gig < ApplicationRecord
    
    belongs_to :user

    has_many :gig_instruments
    has_many :instruments, through: :gig_instruments

    has_many :requests
    has_many :users, through: :requests

    def instruments_attributes=(instrument_attributes)
        instrument_attributes.values.each do |instrument_attribute| 
          if instrument_attribute[:name].present?
          instrument = Instrument.find_or_create_by(instrument_attribute)
          self.instruments << instrument
            if !self.instruments.include?(instrument)
            self.gig_instruments.build(:instrument => instrument)
            end
          end
        end
      end
end
