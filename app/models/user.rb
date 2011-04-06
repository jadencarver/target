class User < ActiveRecord::Base

  validates :email, :presence => true, :format => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :password, :presence => true, :format => /^\S*$/

  attr_reader :password
  def password=(password)
    unless password.blank?
      @password= password
      self.salt= SecureRandom.base64(32)
      self.encrypted_password= Digest::SHA2.hexdigest(password+salt)
    end
  end

  def password_is?(password)
    encrypted_password == Digest::SHA2.hexdigest(password+salt)
  end

end
