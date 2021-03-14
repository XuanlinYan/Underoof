class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome to Underoof!"
            redirect_to new_session_path
        else
            render action: :new
            # its better to use render
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :gender)
    end
end
