class Request < ApplicationRecord
    belongs_to :user
    belongs_to :gig
    validates :application, acceptance: { message: 'box must be checked to apply.' }

    accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['email'].blank?}


    def user_name
        self.try(:user).try(:full_name)
    end
    
    def user_name=(name)
        user = User.find_or_create_by(full_name: name)
        self.user = user
    end

    def gig_name
        self.try(:gig).try(:title)
    end

    def gig_name=(title)
        gig = Gig.find_or_create_by(title: title)
    end

    def authorized_user
        @user = User.find(params[:id])
        @user != current_user
    end
end
