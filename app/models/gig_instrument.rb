class GigInstrument < ApplicationRecord
    belongs_to :instrument, inverse_of: :gig_instruments
    belongs_to :gig
end
