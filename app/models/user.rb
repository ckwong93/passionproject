require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end
  
end
