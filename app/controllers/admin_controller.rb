class AdminController < ApplicationController
    before_action :admin_authorize, only:[:admins]

    def admins
        @preferences = Preference.all()
        render "admin"
    end
end
