class MessagesController < ApplicationController
    before_action :authorize
    before_action :set_channel

    def create
        @message = @channel.messages.create(message_params)
    end

    private

        def set_channel
            @channel = current_user.channels.find(params[:channel_id])
        end

        def message_params
            params.require(:message).permit(:body).merge(user: current_user)
        end
end