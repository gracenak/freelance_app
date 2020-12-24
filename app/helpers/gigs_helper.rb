module GigsHelper
    def index_header
        if current_user.contractor
            "Posted Gigs"
        else
            "Gigs"
        end
    end

    def authorized_edit_button
        if authorized?(@gig.user)
            tag.p(button_to('Edit Gig', edit_user_gig_path(current_user, @gig), method: :get))
        end
    end

    def authorized_delete_button
        if authorized?(@gig.user)
            tag.p(button_to('Delete', @gig, method: :delete))
        end
    end
end