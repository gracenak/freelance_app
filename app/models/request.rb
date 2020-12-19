class Request < ApplicationRecord
    belongs_to :user
    belongs_to :gig
    validates :submit, acceptance: {message: 'You must check the box to apply'}


    accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['email'].blank?}
end
