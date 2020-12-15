class Union < ApplicationRecord
    has_many :users
    has_many :gigs, through: :users
end
