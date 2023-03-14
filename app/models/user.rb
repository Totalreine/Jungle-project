class User < ApplicationRecord
  has_secure_password
    
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true, 
  format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
            message: 'The format of Email is invalid'}
  
  def self.authenticate_with_credentials(email, password)
    validFormatEmail = email.strip.downcase
    user = User.find_by_email(validFormatEmail)
    
    if user && user.authenticate(password)
      user
    else
      nil
    end

  end

end
