require 'bcrypt'

class User < ApplicationRecord

    # after_initialize :ensure_session_token

    validates :user_name, presence: true, uniqueness:true
    validates :session_token, presence: true, uniqueness:true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    has_many :cats,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Cat

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def password
        @password
    end


    def self.find_by_credentials(user_name,password)
        user = User.find_by(user_name: user_name )
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end
    
    def is_password?(password)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(password)
    end


end