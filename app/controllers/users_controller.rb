class UsersController < ApplicationController
    before_action :authorize, only:[:edit, :update]
    before_action :correct_user,   only: [:edit, :update]
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            reset_session
            log_in @user
            flash[:success] = "Welcome to Underoof!"
            redirect_to root_path
        else
            # its better to use render
            render action: :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Profile updated"
            redirect_to edit_user_path(@user)
        else
            render action: :edit
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation, :email, :gender)
    end
end
