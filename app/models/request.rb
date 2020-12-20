class Request < ApplicationRecord
    belongs_to :user
    belongs_to :gig
    validates :application, acceptance: { message: 'box must be checked to apply.' }

    accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['email'].blank?}
end
