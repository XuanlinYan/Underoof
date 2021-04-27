class DirectMessagesController < ApplicationController
    before_action :authorize

    def show
        users = [current_user, User.find(params[:id])]
        @channel = Channel.direct_message_for_users(users)
        render "channels/show"
    end
end
