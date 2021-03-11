class SessionsController < ApplicationController

    def new 

    end

    def create
        @user = User.find_by(name: params[:name], password: params[:password])
        if @user
            session[:user_id] = @user.id
            flash[:notice] = "Successfully Sign in"
            redirect_to root_path
        else
            flash[:notice] = "Incorrect username or password"
            render action: :new
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:notice] = "Exit Successfully"
        redirect_to root_path
    end
end
