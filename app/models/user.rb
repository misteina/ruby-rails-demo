class User < ApplicationRecord
    validates :name, :email, :sex, :city, :password, :password_confirmation, presence: true
    validates :name, 
        format: { with: /\A[a-zA-Z]+\z/}, 
        length: { minimum: 2 }, 
        length: { maximum: 10 },
        uniqueness: true
    validates :email, 
        uniqueness: true,
        format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :sex, inclusion: { in: %w(Male Female)}
    validates :city, 
        format: { with: /\A[a-zA-Z\s]+\z/}, 
        length: { minimum: 3, maximum: 15 }, 
        length: { maximum: 20, maximum: 15 }
    validates :interests, 
        length: { minimum: 0 }, 
        allow_blank: true
    validates :password, 
        confirmation: true,
        length: { minimum: 4, maximum: 15 }
    validates :password_confirmation,
        length: { minimum: 4, maximum: 15 }
end
