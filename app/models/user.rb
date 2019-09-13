class User < ApplicationRecord
    belongs_to :organization, optional: true
    has_many :shifts, dependent: :destroy

    before_save {self.email_address = email_address.downcase}
    validates :name, presence: true, length: {minimum: 3}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email_address, presence: true, length: {maximum: 255}, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
    validates :organization_id, presence: false
    has_secure_password
end
