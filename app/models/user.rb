class User < ApplicationRecord
    has_secure_password
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    validates :name, presence: true
    validates :password, presence: true, length: {minimum: 8}
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    # belongs_to :preference, optional:true
    # belongs_to :condition, optional:true
end
