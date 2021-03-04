class User < ApplicationRecord
    validates :name, presence: {message: "Name cannot empty"}
    validates :name, uniqueness: {message: "Name already exists"}
    validates :password, presence: {message: "password cannot empty"}
    validates :password, length: {minimum: 8, message: "must longer than 8"}
end
