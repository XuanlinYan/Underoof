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
            redirect_to new_session_path
        else
            render action: :new
            # its better to use render
        end
    end
end
