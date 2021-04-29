class User < ApplicationRecord
    has_secure_password
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,15}\z/
    # password should include Upper, Lower, Number. length: 8-15

    validates :name, presence: {message: "cannot empty"}
    validates :email, presence: {message: "cannot empty"}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :gender, presence: {message: "cannot empty"}
    validates :password, presence: {message: "is a combination of uppercase letters, lowercase letters, and numbers. And the length is 8-15"}, format: { with: VALID_PASSWORD_REGEX },
                allow_nil: true
    # User avatar should be a certain format and less than size limit
    validate :acceptable_image_type?
    validate :acceptable_image_size?

    has_one :preference, dependent: :destroy

    # added for active storage image uploading
    has_one_attached :image

    has_many :channel_users, dependent: :destroy
    has_many :channels, through: :channel_users
    has_many :messages, dependent: :destroy

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def acceptable_image_type?
        return unless image.attached?
        return if image.content_type.in? ["image/png",  "image/jpeg"]
        errors.add :image, "must be a PNG or JPG"
    end

    def acceptable_image_size?
        return unless image.attached?
        return unless image.byte_size > 5.megabyte
        errors.add :image, "is over 5MB"
    end

end
