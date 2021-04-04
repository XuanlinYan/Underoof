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

    has_one :preference 

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end
