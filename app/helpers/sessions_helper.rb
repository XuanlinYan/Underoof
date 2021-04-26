module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        reset_session
        @current_user = nil
    end

    def authorize
        unless logged_in?
            flash[:danger] = "Please sign in."
            redirect_to signin_url
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless @user==current_user
    end

    def admin_user?
        # admin@underoof.com
        return current_user.email == "admin@underoof.com"
    end

    def admin_authorize
        unless admin_user?
            flash[:danger] = "Please Input Admin account."
            redirect_to root_path
        end
    end
end
