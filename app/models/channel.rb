class Channel < ApplicationRecord
    has_many :channel_users, dependent: :destroy
    has_many :users, through: :channel_users
    has_many :messages, dependent: :destroy

    validates :name, presence: true

    scope :public_channels, ->{ where(direct_message: false) }
    scope :direct_messages, ->{ where(direct_message: true) }

    def self.direct_message_for_users(users)
        user_ids = users.map(&:id).sort
        name = "DM:#{user_ids.join(":")}"

        if channel = direct_messages.where(name: name).first
            channel
        else
            # create a new chatroom
            channel = Channel.new(name: name, direct_message: true)
            channel.users = users
            channel.save
            channel
        end
    end
end
