module ApplicationHelper
    def authorized?(user)
        user == current_user
    end

    def authorized_create_gig_button
        if current_user.contractor
            tag.p(button_to('New Gig', new_user_gig_path(current_user), method: :get))
        end
    end
end
