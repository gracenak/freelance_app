module GigsHelper
    def index_header
        if current_user.contractor
            "== POSTED GIGS =="
        else
            "== GIGS =="
        end
    end

    def application_form
        if !current_user.contractor
        content_tag(:h3, "Submit Application")
        end
    end


    def authorized_edit_button
        if authorized?(@gig.user)
            tag.p(button_to('Edit Gig', edit_user_path(current_user, @gig), method: :get))
        end
    end

    def authorized_delete_button
        if authorized?(@gig.user)
            tag.p(button_to('Delete', @gig, method: :delete))
        end
    end

end
