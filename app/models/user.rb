class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  has_secure_password

  validates :username,  presence: true, 
                        uniqueness: { case_sensitive: false }, 
                        length: { within: 3..25 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }
end