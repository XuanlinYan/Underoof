class User < ApplicationRecord
    validates :name, presence: {message: "Name cannot empty"}
    validates :name, uniqueness: {message: "Name already exists"}
    validates :password, presence: {message: "password cannot empty"}
    validates :password, length: {minimum: 8, message: "Password must longer than 8"}
    
    # belongs_to :preference, optional:true
    # belongs_to :condition, optional:true
end
