module GigsHelper
    def index_header
        if current_user.contractor
            "== YOUR LIST OF POSTED GIGS =="
        else 
            "== GIGS =="
        end
    end


end
