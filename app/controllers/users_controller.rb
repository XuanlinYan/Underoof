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
            flash[:notice] = "Error! Name already exists or empty, password cannot empty and must longer than 8"
            render action: :new
            # its better to use render
        end
    end
end
