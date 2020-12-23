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
            
    
end
