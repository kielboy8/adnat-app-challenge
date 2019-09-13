class Organization < ApplicationRecord
    has_many :users
    
    validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 50}
    validates :hourly_rate, presence: true, numericality: {only_integer: true, greater_than: 0}
end
