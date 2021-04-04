class SessionsController < ApplicationController
    def new 
    end

    def create
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Welcome to Underoof!"
            reset_session
            log_in user
            redirect_to root_path
        else
            flash[:danger] = "Incorrect username or password"
            render action: :new
        end
    end
    
    def destroy
        flash[:success] = "Log out successfully"
        log_out
        redirect_to root_url
    end
end
