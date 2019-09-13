class User < ApplicationRecord
    belongs_to :organization, optional: true
    has_many :shifts

    before_save {self.email_address = email_address.downcase}
    validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email_address, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
    validates :organization_id, presence: false
    has_secure_password
end
