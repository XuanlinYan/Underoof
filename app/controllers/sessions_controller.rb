class SessionsController < ApplicationController

    def new 

    end

    def create
        user = User.find_by(name: params[:session][:name])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Successfully Sign in"
            redirect_to root_path
        else
            flash[:notice] = "Incorrect username or password"
            render action: :new
        end
    end
    
    def destroy
        session.delete(:user_id)
        session[:user_id] = nil
        flash[:notice] = "Exit Successfully"
        redirect_to root_path
    end
end
