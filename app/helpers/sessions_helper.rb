module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.encrypted[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.encrypted[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
              log_in user
              @current_user = user
            end
        end
    end

    def logged_in?
        !current_user.nil?
    end

    # Forgets a persistent session.
    def forget(user)
       user.forget
       cookies.delete(:user_id)
       cookies.delete(:remember_token)
    end

    def log_out
        forget(current_user)
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
