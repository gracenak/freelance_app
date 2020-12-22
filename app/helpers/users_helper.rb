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
            
    
end
