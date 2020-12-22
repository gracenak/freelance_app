module GigsHelper
    def contractor_gigs_list
        if current_user.contractor == true
            "== LIST OF POSTED GIGS =="
        end
    end


end
