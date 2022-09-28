class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true 
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true, length: { minimum: 3 }


  def self.authenticate_with_credentials(email, password)
    if email 
      stripped_email = email.strip
    else
      return nil
    end
    user = User.find_by_email(stripped_email.downcase)
    #if user exists and password is correct
    if user && user.authenticate(password)
      user
    else
      nil
    end

  end 
end