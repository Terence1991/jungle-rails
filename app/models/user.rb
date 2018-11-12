class User < ActiveRecord::Base
  before_create :downcase_email
  
  has_secure_password
  validates :name , presence: true
  validates :email, presence: true
  validates :password, presence: true
 
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user
    else 
      return nil
    end 
  end

  private
  def downcase_email
    self.email.strip.downcase!
  end 
  
end
