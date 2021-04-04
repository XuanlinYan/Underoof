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
            reset_session
            log_in @user
            redirect_to root_path
        else
            # its better to use render
            render action: :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :gender)
    end
end
