class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :password, :email, :gender))

        if @user.save
            flash[:notice] = "Success! Welcome!"
            redirect_to users_path
        else
            flash[:notice] = "Error! Please try it again"
            redirect_to users_path
        end
    end
end
