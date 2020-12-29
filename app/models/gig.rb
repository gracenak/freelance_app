class Gig < ApplicationRecord
    
    belongs_to :user
    
    has_many :gig_instruments
    has_many :instruments, through: :gig_instruments, dependent: :destroy

    has_many :requests
    has_many :users, through: :requests, dependent: :destroy

    validates :title, :datetime, :description, presence: true
    validates :payment, numericality: {greater_than_or_equal_to: 0}

    def instruments_attributes=(instrument_attributes)
      instrument_attributes.values.each do |attr|
      if attr[:name].present?
        instrument = Instrument.find_or_create_by(name: attr[:name].titleize)
        self.instruments << instrument
        if !self.instruments.include?(instrument)
          self.gig_instruments.build(:instrument => instrument)
          end
        end
      end
    end


    def self.most_recent
        all.order('datetime asc')
    end
  end




