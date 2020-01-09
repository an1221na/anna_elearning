class User < ApplicationRecord
    before_save { email.downcase! }

    validates :name, presence: true, length: { minimum: 2, maximum: 30 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
    validates :email, presence: true, length: {minimum: 10, maximum: 30 },
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, length: { minimum: 4 }, allow_nil: true

    mount_uploader :image, ImageUploader
   
end
