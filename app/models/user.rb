class User < ApplicationRecord
    has_secure_password
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{8,15}\z/
    # password should include Upper, Lower, Number. length: 8-15
    
    validates :name, presence: true
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :gender, presence: true
    validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX }
    
    has_one :preference 
end
