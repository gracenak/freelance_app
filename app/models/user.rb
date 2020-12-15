class User < ApplicationRecord
    belongs_to :union
    has_many :gigs
end
