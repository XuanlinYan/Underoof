class SessionsController < ApplicationController
    def new 
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            reset_session
            remember user
            log_in user
            flash[:success] = "Welcome to Underoof!"
            redirect_to root_path
        else
            flash.now[:danger] = "Incorrect username or password"
            render action: :new
        end
    end
    
    def destroy
        log_out if logged_in?
        flash[:success] = "Log out successfully"
        redirect_to root_url
    end
end
