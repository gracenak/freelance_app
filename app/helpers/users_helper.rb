module UsersHelper

    def welcome_header
        if current_user
            "Welcome, #{current_user.first_name}!" 
        end
    end

    def contractor_header
        if @user.contractor && @user == current_user
            "== CONTRACTOR STATUS =="
        end
    end

    def meet_musicians
        if @user != current_user 
            "== Meet Your Fellow Musician =="
        end
    end

    def authorized_to_update_user
        if authorized?(@user)
        tag.p(button_to('Update Your Profile', edit_user_path(current_user), method: :get))
        end
    end

    def authorized_posted_gigs
        if authorized?(@user) && @user.contractor
        tag.p(link_to("Your Posted Gigs", user_gigs_path(@user), method: :get))
        end
    end    
end